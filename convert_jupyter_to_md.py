"""ipynb를 Blog의 html로 변경하는 도구.

[description]

"""
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


def convert_ipynb_to_post(path_ipynb, _folder_github_page, b_exclud_code=True, b_numbering=False) -> HeaderIpynb:
    """ipynb를 mardkdown file로 변환.
    
    [description]
    
    Parameters
    ----------
    path_ipynb : str
        파일 경로
    _folder_github_page : str
        변환 파일을 저장할 폴더
    b_exclud_code : bool,
        [description] (the default is True)
    b_numbering : bool
        [description] (the default is False)
    
    Returns
    -------
    HeaderIpynb
        [description]

    """
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

    if b_numbering:
        md = numbering_of_header_of_md(md)

    md = re.sub('../assets/images/', '/assets/images/', md)

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


def count_sharp(line):
    r"""문장에서 시작하는 #의 개수를 센다.

    Parameters
    ----------
    line : str
        #으로 시작하는 문장

    Returns
    -------
    int
        시작하는 #의 개수

    """
    n_sharp = 0
    for char in line:
        if char == '#':
            n_sharp += 1
        else:
            break
    return n_sharp


def convert_n_sharp_to_number(n_sharp_list):
    r"""Markdown의 #의 List를 받아서 숫자로 변경한다.

    Parameters
    ----------
    n_sharp_list : List[int]
        Sharp의 개수를 저장한 List

    Returns
    -------
    str
        [description]

    """
    n_sharp_last = n_sharp_list[-1]
    num_list = [0] * (max(n_sharp_list)+1)
    number_str = ''

    for n_sharp_cur in n_sharp_list:
        num_list[n_sharp_cur] += 1
        for idx in range(n_sharp_cur+1, len(num_list)):
            num_list[idx] = 0

    for idx in range(2, n_sharp_last+1):
        number_str += f'{num_list[idx]}.'

    return number_str + ' '


def numbering_of_header_of_md(md_str):
    """Markdown Header에 숫자를 넣고 Header간 간격을 둔다.

    Parameters
    ----------
    md_str : str
        Markdown Type String

    Returns
    -------
    str
        Markdown Type String

    """
    b_block: bool = False
    n_valid_line = 0
    n_header_line = -1
    md_list_old = md_str.split('\n')
    md_list: List[str] = []
    n_sharp_list: List[str] = []

    for line in md_list_old:
        line_strip = line.strip()
        if len(line_strip) > 0:
            n_valid_line += 1

            if b_block is False and line_strip[0] == '#':
                if n_header_line != -1 and n_header_line + 1 != n_valid_line:
                    md_list.append('<br>')
                    md_list.append('')
                n_header_line = n_valid_line

                n_sharp = count_sharp(line)
                if n_sharp > 1:  # 1은 코드의 제목으로 Numbering을 하지 않는다.
                    n_sharp_list.append(n_sharp)
                    line = line[:n_sharp+1] + \
                        convert_n_sharp_to_number(
                            n_sharp_list) + line[n_sharp+1:]

            elif b_block is False and line_strip[:3] == '```':
                b_block = True

            elif b_block is True:
                if line_strip[:3] == '```':
                    b_block = False

        md_list.append(line)

    return '\n'.join(md_list)


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
        header = convert_ipynb_to_post(pathname, folder_github_page, b_numbering=True)
        tags_in_ipynb.extend(header.tags)
    for pathname in glob.iglob('/home/ok97465/python/BlogSrcByJupyter/Python/*.ipynb', recursive=True):
        header = convert_ipynb_to_post(
            pathname, folder_github_page, b_numbering=True)
        tags_in_ipynb.extend(header.tags)

    tag_not_exist = check_tags_in_home_page(tags_in_ipynb, folder_github_page)

    copy_tree(
        '/home/ok97465/python/BlogSrcByJupyter/assets', folder_github_page+'/assets')

    print(f'Check tag : {tag_not_exist}')
