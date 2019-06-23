#!/usr/bin/python3

# This test tries document reload action.

import os
os.environ['LANG']='C'
srcdir = os.environ['srcdir']

from dogtail.procedural import *

run('atril', arguments=' '+srcdir+'/test-page-labels.pdf')

focus.widget('page-label-entry')
focus.widget.text = "iii"
activate()

if focus.widget.text != "III":
    click('File', roleName='menu')
    click('Close', roleName='menu item')
    exit (1)

# Close atril
focus.application('atril')
click('File', roleName='menu')
click('Close', roleName='menu item')
