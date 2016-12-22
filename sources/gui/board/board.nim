#? replace(sub = "\t", by = " ")




include ./board_types.nim




var
	board_window_scrollable: ScrolledWindow = gtk3.newScrolledWindow(nil, nil)
	board_overlay = gtk3.newOverlay()

	board_grid_cells = gtk3.newGrid()
	board_grid_pieces = gtk3.newGrid()
	board_grid_highlights = gtk3.newGrid()
	board_grid_buttons = gtk3.newGrid()


include ./board_cells.nim


#discard gobject.gSignalConnect(board_grid_cells, "size-allocate", cast[GCallback](some_text), nil)
gtk3.addOverlay (board_overlay,  board_grid_cells)
gtk3.addWithViewport (board_window_scrollable,  board_overlay)
