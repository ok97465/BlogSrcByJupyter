import re
import os
import glob
import shutil
from distutils.dir_util import copy_tree
from datetime import datetime
from typing import NamedTuple, List
from nbconvert.exporters import MarkdownExporter


HeaderIpynb = NamedTuple('HeaderIpynb', [('layout', str), ('title', str), ('comments', str), ('date', datetime),
                                         ('tags', List[str]), ('description', str)])


def _parse_ipynb_header(content: str) -> HeaderIpynb:
    header_str = re.findall('---\n.*?---', content, flags=re.DOTALL)[0]

    layout = re.findall('---\nlayout:(.*?)\n', header_str,
                        flags=re.DOTALL)[0].strip()
    title = re.findall('\ntitle:(.*?)\n', header_str,
                       flags=re.DOTALL)[0].strip()
    if title[0] == '"' and title[-1] == '"':
        title = title[1:-1]
    comments = re.findall('\ncomments:(.*?)\n', header_str,
                          flags=re.DOTALL)[0].strip()
    date_str = re.findall('\ndate:(.*?)\n', header_str,
                          flags=re.DOTALL)[0].strip()
    tags_str = re.findall('\ntags:(.*?)\n', header_str,
                          flags=re.DOTALL)[0].strip()
    description = re.findall('\ndescription:(.*?)\n',
                             header_str, flags=re.DOTALL)[0].strip()

    date = datetime.strptime(date_str, '%Y-%m-%d %H:%M:%S')
    tags = tags_str.split(' ')
    tags = [s.strip() for s in tags]

    _header = HeaderIpynb(layout, title, comments, date, tags, description)

    return _header


def convert_ipynb_to_post(path_ipynb: str, _folder_github_page: str, b_exclud_code: bool=True) -> HeaderIpynb:
    _folder_github_page = os.path.abspath(_folder_github_page)

    filename_ext_ipynb = os.path.split(path_ipynb)[1]
    filename_ipynb = os.path.splitext(filename_ext_ipynb)[0]

    exporter = MarkdownExporter()

    md, resource = exporter.from_filename(path_ipynb)
    md = md.strip()

    md = re.sub('///---', '---', md)
    if b_exclud_code:
        md = re.sub('(    ```python\n.*?    ```)',
                    lambda m: re.sub("^" + "    ", "",
                                     m.group(1), flags=re.MULTILINE),
                    md, flags=re.DOTALL)
        md = re.sub('```python\n# Show in Markdown\n',
                    '---python\n# Show in Markdown', md)
        md = re.sub('```python\n.*?```\n', '', md, flags=re.DOTALL)
        md = re.sub('---python\n# Show in Markdown', '```python\n', md)

    md = re.sub('# Show in Markdown\n', '', md)

    _header = _parse_ipynb_header(md)

    filename_post = f'{_header.date.strftime("%Y-%m-%d")}-{filename_ipynb}'
    folder_post = f'{_folder_github_page}{os.sep}_posts{os.sep}'
    folder_img = f'{_folder_github_page}{os.sep}assets{os.sep}images{os.sep}{filename_post}{os.sep}'

    shutil.rmtree(folder_img, ignore_errors=True)
    os.mkdir(folder_img)

    outputs = resource['outputs']
    for filename_img, data in outputs.items():
        pattern = r'!\[png\]\({}\)'.format(filename_img)
        result_re = re.findall(pattern, md)
        if len(result_re) > 0:
            filename_img_in_web = f"![img]({{{{ '/assets/images/{filename_post}/{filename_img}' | relative_url }}}})" \
                                  f"{{: .center-image }}"
            md = re.sub(pattern, filename_img_in_web, md)
            with open(f'{folder_img}{filename_img}', 'wb') as f:
                f.write(data)

    with open(f'{folder_post}{filename_post}.md', 'w', encoding='utf-8') as file_md:
        file_md.write(md)

    return _header


def check_tags_in_home_page(tags_in_content: List[str], _folder_github_page: str) -> List[str]:
    _tag_not_exist = []
    folder_tags = f'{os.path.abspath(_folder_github_page)}{os.sep}tag{os.sep}'
    tags_file = []
    tags_in_content = set(tags_in_content)

    for pathname_tag in glob.iglob(f'{folder_tags}*.md', recursive=True):
        filename_tag = os.path.splitext(os.path.split(pathname_tag)[1])[0]
        tags_file.append(filename_tag)

    for tag_in_content in tags_in_content:
        if tag_in_content not in tags_file:
            _tag_not_exist.append(tag_in_content)

    return _tag_not_exist


if __name__ == '__main__':
    tags_in_ipynb = []
    folder_github_page = '/home/ok97465/ok97465.github.io'
    for pathname in glob.iglob('/home/ok97465/python/BlogSrcByJupyter/Math/*.ipynb', recursive=True):
        header = convert_ipynb_to_post(pathname, folder_github_page)
        tags_in_ipynb.extend(header.tags)
    for pathname in glob.iglob('/home/ok97465/python/BlogSrcByJupyter/Python/*.ipynb', recursive=True):
        header = convert_ipynb_to_post(pathname, folder_github_page)
        tags_in_ipynb.extend(header.tags)

    tag_not_exist = check_tags_in_home_page(tags_in_ipynb, folder_github_page)

    copy_tree(
        '/home/ok97465/python/BlogSrcByJupyter/assets', folder_github_page+'/assets')

    print(f'Check tag : {tag_not_exist}')
