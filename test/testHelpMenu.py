#!/usr/bin/python3

# This test opens the Help menu and runs through the menu items.

from testCommon import run_app, bail, pushButton

from dogtail.procedural import *

try:
    run_app()

    click('Help', roleName='menu')
    click('About', roleName='menu item')
    focus.dialog('About Atril Document Viewer')
    click('License', roleName='toggle button')
    click('Close', roleName=pushButton)

    focus.frame('')
    click('Help', roleName='menu')
    click('Contents', roleName='menu item')

    keyCombo('<Control>w')

    focus.frame('')
    click('File', roleName='menu')
    click('Close', roleName='menu item')
except:
    bail()
