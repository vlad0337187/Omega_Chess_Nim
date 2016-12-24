#? replace(sub = "\t", by = " ")

#[ Contains code to add all cells to it's grids. After this board.nim will operate with that grids.
]#








# Fill cells with playable dark\light colors and attach them to board
var color_cells: array[1..144, ref board_cell_type]

for line in 1..12:
	for row in 1..12:
		#var index = (12 * (i - 1)) + i2 changed to:
		var index = receive_cell_index_from_line_row(line, row)

		color_cells[index] = new(board_cell_type)

		var line_start_color =  if bool(line mod 2):  dark  else:  light
		var color: colors_type

		if line_start_color == dark:
			if bool(row mod 2):  # non-pair number
				color = dark
			else:  # pair number
				color = light

		else:  # start color - light
			if bool(row mod 2):  # non-pair number
				color = light
			else:  # pair number
				color = dark

		color_cells[index].cell_color = color
		if color == light:
			fill_cell_with_new_image(color_cells[index], "/images/cells/general_light.svg")
			#var surface_image = newImage(surface)
			#var pixbuf = rsvg.rsvgHandleGetPixbuf(board_light_cell_svg)
			#echo "Pixbuf's size:", width(pixbuf), height(pixbuf)
			#var image: gtk3.Image
			#gtk3.setFromPixbuf(image, pixbuf)
			#color_cells[index].image = surface_image
		elif color == dark:
			fill_cell_with_new_image(color_cells[index], "/images/cells/general_dark.svg")

		gtk3.attach(board_grid_cells, color_cells[index].image, cint(line-1), cint(row-1), cint(1), cint(1))
		#  widget "board_window_scrollable" is from board.nim


# Change board's borders to black squares with numbering
# First front line:
#for i in 2..11:








# Fill cells with pieces widgets:
var pieces_cells: array[1..144, ref piece_cell_type]

for line in 1..12:
	for row in 1..12:
		#var index = (12 * (line - 1)) + row
		var index = receive_cell_index_from_line_row(line, row)

		pieces_cells[index] = new(piece_cell_type)
		pieces_cells[index].image = gtk3.newImage()

		gtk3.attach(board_grid_pieces, pieces_cells[index].image, cint(line-1), cint(row-1), cint(1), cint(1))








# Fill cells with highlights:
var highlight_cells: array[1..144, ref hightlight_cell_type]

for line in 1..12:
	for row in 1..12:
		#var index = (12 * (i - 1)) + i2
		var index = receive_cell_index_from_line_row(line, row)

		highlight_cells[index] = new(hightlight_cell_type)
		highlight_cells[index].image = gtk3.newImage()

		gtk3.attach(board_grid_highlights, highlight_cells[index].image, cint(line-1), cint(row-1), cint(1), cint(1))



# Fill cells with pseudo-buttons (gtk3.Event):
var pseudobuttons_cells: array[1..144, ref pseudobutton_type]

for line in 1..12:
	for row in 1..12:
		#var index = (12 * (i - 1)) + i2
		var index = receive_cell_index_from_line_row(line, row)

		pseudobuttons_cells[index] = new(pseudobutton_type)
		pseudobuttons_cells[index].image = gtk3.newImage()

		gtk3.attach(board_grid_highlights, pseudobuttons_cells[index].button, cint(line-1), cint(row-1), cint(1), cint(1))




echo "HAs horizontal expand or no ?: ", gtk3.getHexpand(color_cells[13].image)
echo "HAs vertical expand or no ?: ", gtk3.getVexpand(color_cells[13].image)
