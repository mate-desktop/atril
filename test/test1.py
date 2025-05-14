#!/usr/bin/python3

# This test opens the interface and just clicks around a bit.

from testCommon import pushButton

from dogtail.procedural import *

run('atril')

# Test file->open
focus.application('atril')
click('File', roleName='menu')
click('Open…', roleName='menu item')
click('Cancel', roleName=pushButton)

# Toolbar editor
focus.application('atril')
click('Edit', roleName='menu')
click('Toolbar', roleName='menu item')
click('Close', roleName=pushButton)

# About dialog
focus.application('atril')
click('Help', roleName='menu')
click('About', roleName='menu item')
click('Credits', roleName='toggle button')
click('Credits', roleName='toggle button')
click('Close', roleName=pushButton)

# Close atril
focus.application('atril')
click.menu('File')
click('Close', roleName='menu item')
