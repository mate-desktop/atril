#!/usr/bin/python3

# Test printing

import os
os.environ['LANG']='C'
srcdir = os.environ['srcdir']

from dogtail.procedural import *

run('atril', arguments=' '+srcdir+'/test-page-labels.pdf')

#!/usr/bin/python
from dogtail.procedural import *

focus.application('atril')
focus.frame('test-page-labels.pdf')
click('File', roleName='menu')
click('Print...', roleName='menu item')
focus.dialog('Print')
click('Pages:', roleName='radio button')
keyCombo('Tab')
type('1')
click('Page Setup', roleName='page tab', raw=True)
click('All sheets')
click('Even sheets')
click('Print Preview', roleName='push button')
keyCombo('Return')
click('Cancel')

# Close atril
click('File', roleName='menu')
click('Close', roleName='menu item')
