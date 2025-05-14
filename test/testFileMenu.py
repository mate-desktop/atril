#!/usr/bin/python3

# Test that the File menu and menu items work correctly.

from testCommon import run_app, bail, pushButton

from dogtail.procedural import *

try:
    run_app(file='test-links.pdf')

    # Open a file
    click('File', roleName='menu')
    click('Open…', roleName='menu item')
    click('Cancel', roleName=pushButton)

    # Save As
    focus.frame('test-links.pdf')
    click('File', roleName='menu')
    click('Save As…', roleName='menu item')
    click('Cancel', roleName=pushButton)

    # Print
    focus.frame('test-links.pdf')
    click('File', roleName='menu')
    click('Print…', roleName='menu item')
    focus.dialog('Print')
    click('Cancel', roleName=pushButton)

    # Properties
    focus.frame('test-links.pdf')
    click('File', roleName='menu')
    click('Properties', roleName='menu item')
    click('Fonts', roleName='page tab')
    click('General', roleName='page tab')
    focus.dialog('Properties')
    click('Close', roleName=pushButton)

    # Close
    focus.frame('test-links.pdf')
    click('File', roleName='menu')
    click('Close', roleName='menu item')

except:
    bail()
