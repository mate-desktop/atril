#!/usr/bin/python3

# This test opens a password encrypted file and tries to unlock it.

import os
os.environ['LANG']='C'
srcdir = os.environ['srcdir']

from dogtail.procedural import *

run('atril', arguments=' '+srcdir+'/test-encrypt.pdf')

# Try an incorrect password first
focus.application('atril')
type('wrong password')
click('Unlock Document', roleName='push button')
focus.dialog('Enter password')
click('Cancel', roleName='push button')

# Try again with the correct password
focus.frame('test-encrypt.pdf — Password Required')
click('Unlock Document', roleName='push button')
focus.dialog('Enter password')
type('Foo')
click('Unlock Document', roleName='push button')

# Close atril
focus.application('atril')
click('File', roleName='menu')
click('Close', roleName='menu item')
