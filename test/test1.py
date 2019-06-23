#!/usr/bin/python3

# This test opens the interface and just clicks around a bit.

import os
import dogtail.config
dogtail.config.config.logDebugToStdOut = True
dogtail.config.config.logDebugToFile = False

from dogtail.procedural import *

os.environ['LANG']='C'
run('atril')

# Test file->open
focus.application('atril')
click('File', roleName='menu')
click('Open…', roleName='menu item')
click('Cancel', roleName='push button')

# Toolbar editor
focus.application('atril')
click('Edit', roleName='menu')
click('Toolbar', roleName='menu item')
click('Close', roleName='push button')

# About dialog
focus.application('atril')
click('Help', roleName='menu')
click('About', roleName='menu item')
click('Credits', roleName='toggle button')
click('Credits', roleName='toggle button')
click('Close', roleName='push button')

# Close atril
focus.application('atril')
click.menu('File')
click('Close', roleName='menu item')
