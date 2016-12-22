#? replace(sub = "\t", by = " ")
# Main file, which starts other files.




import os  # for working with directories.
# uses: settings.nim, board_cells.nim, etc

import ./sources/settings/settings


include ./sources/gui/window.nim
