#!/home/ok97465/anaconda3/bin/python

import re
import sys
import os
import subprocess
import webbrowser
from jupyter_index import write_index_ipynb
from notebook import notebookapp
from jupyterlab.labapp import main

if __name__ == '__main__':
    jupyter_server_list = list(notebookapp.list_running_servers())
    write_index_ipynb(r'/home/ok97465/python/BlogSrcByJupyter')

    if len(jupyter_server_list) > 0:
        webbrowser.open(jupyter_server_list[0]['url']+'lab')
    else:
        os.chdir('/home/ok97465/python/BlogSrcByJupyter')
        sys.exit(main(port=9876))
