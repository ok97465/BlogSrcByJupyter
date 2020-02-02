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
    port = 9876
    jupyter_server_list = list(notebookapp.list_running_servers())
    write_index_ipynb(r'/home/ok97465/codepy/BlogSrcByJupyter')
    b_server = False

    for jupyter_server in jupyter_server_list:
        if(jupyter_server['port'] == port):
            webbrowser.open(jupyter_server['url']+'lab')
            b_server=True
    
    if b_server==False:
        os.chdir('/home/ok97465/codepy/BlogSrcByJupyter')
        sys.exit(main(port=port))
