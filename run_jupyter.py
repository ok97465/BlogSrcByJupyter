#!/home/ok97465/anaconda3/bin/python

import re
import sys
import os
import subprocess
import webbrowser
from notebook import notebookapp
from notebook.notebookapp import main

if __name__ == '__main__':
    jupyter_server_list = list(notebookapp.list_running_servers())

    if len(jupyter_server_list) > 0:
        webbrowser.open(jupyter_server_list[0]['url']+'tree')
    else:
        os.chdir('/home/ok97465/python/BlogSrcByJupyter')
        sys.exit(main())
