"""SettingPycharm.ipynb의 코드 snippets을 vscode 형태로 변환

[description]

"""

import re
from typing import NamedTuple, TextIO, List


class SnippetInfo(NamedTuple):
    description: str
    code_list: List[str]


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

def split_code_str_of_ipynb(code_str) -> List[str]:
    """ipybn의 code 문자열을 명령별로 분할하여 List에 저장
    
    Parameters
    ----------
    code_str : str
        ipynb의 code 문자열
    
    Returns
    -------
    List[str]
        List[code]
    """

    code_str = code_str.replace('\\n', '')

    cursor_order = re.findall(r'\$([0-9])\$', code_str)

    if cursor_order:
        cursor_order.sort()
        n_cursor_order = len(cursor_order)
        for idx, order in enumerate(cursor_order):
            if idx == (n_cursor_order-1) and '$END$' not in code_str:
                code_str = code_str.replace(f'${order}$', f'$0')
            else:
                code_str = code_str.replace(f'${order}$', f'${order}')

    code_str = code_str.replace('$END$', '$0')

    code_list = code_str.split(',\n')
    code_list = [code.strip() for code in code_list if code.strip() != '']
    return code_list



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
    fp.write('\t// }\n\n')


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
                code_list=split_code_str_of_ipynb(snippet_str[3]))
        
        print(f'Snippets = {list(snippets.keys())}')

    with open('python.json', 'w') as fp:
        write_python_json_header(fp)
        n_key = len(snippets.keys())
        for idx, abbreviation in enumerate(list(snippets.keys())):
            fp.write(f'\t"{snippets[abbreviation].description}": {{\n')
            fp.write(f'\t "prefix": "{abbreviation}",\n')
            fp.write(f'\t "body": [\n')

            n_code = len(snippets[abbreviation].code_list)
            for idx_code, code  in enumerate(snippets[abbreviation].code_list):
                if idx_code < n_code-1:
                    fp.write(f'\t\t{code},\n')
                else:
                    fp.write(f'\t\t{code}\n')

            fp.write(f'\t ]\n')
            if idx < n_key - 1:
                fp.write(f'\t}},\n')
            else:
                fp.write(f'\t}}\n')
        fp.write('}')
