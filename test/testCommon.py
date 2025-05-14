#!/usr/bin/python3

import os
import sys
import signal

os.environ['LANG'] = 'C'

# try and figure out the role name for push buttons, which changed in ATSPI 2.53
try:
    import gi
    gi.require_version('Atspi', '2.0')
    from gi.repository import Atspi

    pushButton = Atspi.role_get_name(Atspi.Role.PUSH_BUTTON)
except ImportError:
    pushButton = 'push button'

from dogtail.config import config
config.logDebugToStdOut = True
config.logDebugToFile = False

import dogtail.procedural as dt

def run_app(file=None):
    global pid

    if file is not None:
        arguments = os.path.join(os.path.dirname(__file__), file)
    else:
        arguments = ''
    pid = dt.run(sys.argv[1], arguments=arguments, appName='atril')

def bail():
    os.kill(pid, signal.SIGTERM)
    sys.exit(1)
