# -*- coding: utf-8 -*-
"""지정된 폴더의 모듈들의 함수와 class 이름을 가져온다.

:File name: get_function_name.py
:author: ok97465
:Date created: 2019.03.12

"""
# Standard library imports
import json
import re
from pathlib import Path


def get_name(statmt, text):
    names = re.findall(r'\n{} ([a-zA-Z0-9_]*)[\ ]*[\(|\:]'.format(statmt),
                       text)
    return names


FOLDER_NAME = '/home/ok97465/python/scientific'

path_list = Path(FOLDER_NAME).glob('**/*.py')

import_info = {}

for path in path_list:
    with open(path) as fp:
        if path.match('__init__.py'):
            continue

        module_name = str(path.relative_to(FOLDER_NAME))
        module_name = module_name.replace('.py', '')
        module_name = module_name.replace('/', '.')

        if module_name.find('test') > -1 or module_name.find('._') > -1 or \
           module_name[0] == '.':
            continue

        try:
            lines = ''.join(fp.readlines())
        except UnicodeDecodeError:
            continue

        lines = '\n' + lines  # for get_name function
        func_names = get_name('def', lines)
        class_names = get_name('class', lines)

        func_names = filter(lambda x: len(x) > 0 and x[0] != '_', func_names)
        class_names = filter(lambda x: len(x) > 0 and x[0] != '_', class_names)

        names = []
        names.extend(func_names)
        names.extend(class_names)

        if len(names) > 0:
            import_info[module_name] = names

with open('import_project.json', 'w') as fp:
    json.dump({'module': import_info}, fp, indent=4)
