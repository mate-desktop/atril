#!/usr/bin/python3

# Test printing

import os
from testCommon import pushButton
from dogtail.procedural import *

srcdir = os.environ['srcdir']

recent_used = os.path.expanduser('~/.local/share/recently-used.xbel')
recent_used_orig = recent_used + '.orig'

ps_file = os.path.expanduser('~/output.ps')

if os.path.isfile(recent_used):
    os.rename(recent_used, recent_used_orig)

if os.path.exists(ps_file):
    os.unlink(ps_file)

run('atril', arguments=' '+srcdir+'/test-page-labels.pdf')

focus.application('atril')
click('File', roleName='menu')
click('Print…', roleName='menu item')

click('Print to File', roleName='table cell', raw=True)
click('Postscript', roleName='radio button', raw=True)
click('Print', roleName=pushButton)

statinfo = os.stat (ps_file)
if statinfo.st_size > 100000:
    exit(1)
os.unlink (ps_file)

# Close atril
focus.application('atril')
click('File', roleName='menu')
click('Close', roleName='menu item')

if os.path.isfile(recent_used_orig):
    os.rename(recent_used_orig, recent_used)
