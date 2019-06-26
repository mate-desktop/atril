#!/usr/bin/python3

# Test printing

import os
import dogtail.config
import time
dogtail.config.config.logDebugToStdOut = True
dogtail.config.config.logDebugToFile = False

os.environ['LANG']='C'
srcdir = os.environ['srcdir']

from dogtail.procedural import *

run('atril', arguments=' '+srcdir+'/test-page-labels.pdf')

focus.application('atril')
focus.frame('test-page-labels.pdf')
click('File', roleName='menu')
click('Print…', roleName='menu item')
focus.dialog('Print')
click('Pages:', roleName='radio button')
focus.text('Pages')
type('1')
focus.dialog('Print')
click('Page Setup', roleName='page tab', raw=True)
click('All sheets')
click('Odd sheets', roleName='menu item')
click('Preview', roleName='push button')
keyCombo('<Alt><F4>')

# Close atril
focus.application('atril')
click('File', roleName='menu')
click('Close', roleName='menu item')
