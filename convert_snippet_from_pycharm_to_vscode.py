"""SettingPycharm.ipynb의 코드 snippets을 vscode 형태로 변환

[description]

"""

import re
from typing import NamedTuple, TextIO


class SnippetInfo(NamedTuple):
    description: str
    code: str


def extract_abbreviation(abbreviation_str):
    """문자열에서 축약어를 추출한다.
    
    Parameters
    ----------
    abbreviation_str : str
        축약어가 들어있는 문자열
    
    Returns
    -------
    str
        축약어
    """
    abbreviation_str = abbreviation_str.strip()
    if abbreviation_str[0] == ':':
        abbreviation_str = abbreviation_str[1:]
    
    return abbreviation_str.strip()


def write_python_json_header(fp):
    """python.json의 주석을 작성한다.
    
    Parameters
    ----------
    fp : TextIO
        파일 핸들러
    
    """
    fp.write('{\n')
    fp.write('\t// Place your snippets for python here. Each snippet is defined under a snippet name and has a prefix, body and \n')
    fp.write('\t// description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:\n')
    fp.write('\t// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the \n')
    fp.write('\t// same ids are connected.\n')
    fp.write('\t// Example:\n')
    fp.write('\t// "Print to console": {\n')
    fp.write('\t// 	"prefix": "log",\n')
    fp.write('\t// 	"body": [\n')
    fp.write('\t// 	\t"console.log(\'$1\');",\n')
    fp.write('\t// 	\t"$2"\n')
    fp.write('\t// 	],\n')
    fp.write('\t// 	"description": "Log output to console"\n')
    fp.write('\t// }\n')


if __name__ == "__main__":
    ipynb_pattern = (
        r'"cell_type": "markdown",\n' + 
        r'   "metadata": {},\n' +
        r'   "source": \[\n' +
        r'    "### (.*?)\\n",\n' +
        r'    "Abbreviation(.*?)\\n",\n' +
        r'    "Template text(.*?)\\n",\n' +
        r'    "``` python\\n",\n'
        r'(.*?)"```"\n' +
        r'   ]\n')

    snippets = dict()
    with open('Python/180904_SettingPycharm.ipynb', 'r') as fp:
        lines = fp.readlines()
        lines = ''.join(lines)
        snippet_strs = re.findall(ipynb_pattern, lines, flags=re.DOTALL)
        
        for snippet_str in snippet_strs:
            abbreviation = extract_abbreviation(snippet_str[1])
            snippets[abbreviation] = SnippetInfo(
                description=snippet_str[0],
                code=snippet_str[3])
        
        print(f'Snippets = {list(snippets.keys())}')

    with open('python.json', 'w') as fp:
        write_python_json_header(fp)
        for abbreviation in list(snippets.keys()):
            fp.write(f'\t"{snippets[abbreviation].description}": {{\n')
            fp.write(f'\t "prefix": "{abbreviation}",\n')
            fp.write(f'\t "body": [\n')
            fp.write(f'\t ]\n')
            fp.write(f'\t}}\n')
        fp.write('}')
