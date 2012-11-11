xbmc-utils
==========

Various XBMC bash helper scripts

xbmc-package-addon
------------------
xbmc-package-addon.sh creates a zip addon package from the specified addon path

Usage: `xbmc-package-addon.sh [addon-path]`

If no addon path is specified the current directory will be used (assuming addon.xml exists in the current directory).

Note: This addon makes use of [XMLStarlet](http://xmlstar.sourceforge.net/) in order to parse addon.xml so make sure you have that installed
