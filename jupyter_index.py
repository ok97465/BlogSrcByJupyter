r"""Jupyter Notebook의 파일 Index를 생성한다.


[Description]

Example
-------
[example]

:File name: jupyter_index.py
:author: ok97465
:Date created: 2018-09-15 오후 11:00
"""

import os
import glob
from typing import TextIO


def write_header_ipynb(fp):
    r"""ipynb의 헤더를 작성한다.

    Parameters
    ----------
    fp : TextIO
        문자열 쓰기 모드의 파일 Handler

    """

    fp.write("{\n")
    fp.write(" \"cells\": [\n")
    fp.write("  {\n")
    fp.write("   \"cell_type\": \"markdown\",\n")
    fp.write("   \"metadata\": {},\n")
    fp.write("   \"source\": [\n")
    fp.write("    \"# Contents\\n\",\n")


def write_tail_ipynb(fp):
    r"""ipynb의 헤더를 작성한다.

    Parameters
    ----------
    fp : TextIO
        문자열 쓰기 모드의 파일 Handler

    """

    fp.write("   ]\n")
    fp.write("  }\n")
    fp.write(" ],\n")
    fp.write(" \"metadata\": {\n")
    fp.write("  },\n")
    fp.write(" \"nbformat\": 4,\n")
    fp.write(" \"nbformat_minor\": 2\n")
    fp.write("}\n")


def write_index_ipynb(folder_base: str):
    r"""폴더 내부의 ipynb 파일을 찾아 index.ipynb에 정리한다.

    Parameters
    ----------
    folder_base : str
        ipynb 파일을 정리할 폴더

    """

    folder_base = os.path.abspath(folder_base)
    folder_base = folder_base.replace('\\', '/')

    pathnames = list(glob.iglob(folder_base + os.sep +
                                '**/*.ipynb', recursive=True))
    pathnames = [x for x in pathnames if "index.ipynb" not in x]

    pathnames.sort()

    cur_folder = ''

    with open(folder_base + os.sep + 'index.ipynb', 'w') as fp:
        write_header_ipynb(fp)

        for idx, path in enumerate(pathnames):

            folder_of_path, file_of_path = os.path.split(path)
            folder_of_path = folder_of_path.replace('\\', '/')
            folder_of_path = folder_of_path.replace(folder_base + '/', "")
            folder_of_path = folder_of_path.replace(folder_base, "")

            if len(file_of_path) > 7 and file_of_path[0:6].isdigit() and file_of_path[6] == '_':
                file_mangled = file_of_path[7:]

            else:
                file_mangled = file_of_path

            file_mangled = os.path.splitext(file_mangled)[0]

            if cur_folder != folder_of_path:
                cur_folder = folder_of_path
                fp.write('    "\\n",\n    "<br>\\n",\n    "\\n",\n')

                if cur_folder == '':
                    fp.write(f'    "- /\\n",\n')
                else:
                    fp.write(f'    "- /{cur_folder}\\n",\n')

            ipynb_content = f'    \"  - [{file_mangled}]('

            if folder_of_path != '':
                ipynb_content += f'{folder_of_path}/'
            ipynb_content += f'{file_of_path})\\n\"'

            if idx != len(pathnames) - 1:
                ipynb_content += ','
            fp.write(ipynb_content + '\n')

        write_tail_ipynb(fp)


if __name__ == "__main__":
    write_index_ipynb(r'/home/ok97465/codepy/BlogSrcByJupyter')
