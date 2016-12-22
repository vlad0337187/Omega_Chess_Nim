#? replace(sub = "\t", by = " ")





var color_cells: array[1..144, ref board_cell_type]

# Fill cells with playable dark\light colors
for i in 1..12:
	for i2 in 1..12:
		var index = (12 * (i - 1)) + i2

		color_cells[index] = new(board_cell_type)

		var line_start_color =  if bool(i mod 2):  dark  else:  light
		var color: colors_type

		if line_start_color == dark:
			if bool(i2 mod 2):  # non-pair number
				color = dark
			else:  # pair number
				color = light

		else:  # start color - light
			if bool(i2 mod 2):  # non-pair number
				color = light
			else:  # pair number
				color = dark

		color_cells[index].color = color

		#var image_widget_pointer = ref color_cells[index]
		if color == light:
			#fill_cell_with_new_image(color_cells[index], "/images/cells/general_light.svg")
			discard
			#var pixbuf = rsvg.rsvgHandleGetPixbuf(board_light_cell_svg.svg)
			#var image = new(gtk3.Image)
			#gtk3.setFromPixbuf(image[], pixbuf)
			#color_cells[index].image = image[]

		elif color == dark:
			fill_cell_with_new_image(color_cells[index], "/images/cells/general_dark.svg")

		gtk3.attach(board_grid_cells, color_cells[index].image, cint(i-1), cint(i2-1), cint(1), cint(1))
		#  widget "board_window_scrollable" is from board.nim


# Change board's borders to black squares with numbering
# First front line:
#for i in 2..11:





var pieces_cells: array[1..144, ref piece_cell_type]

# Fill cells with pieces widgets
for i in 1..12:
	for i2 in 1..12:
		var index = (12 * (i - 1)) + i2

		pieces_cells[index] = new(piece_cell_type)

		#pieces_cells[index].color = color
		pieces_cells[index].image = gtk3.newImage()





var highlight_cells: array[1..144, ref hightlight_cell_type]

# Fill cells with highlights
for i in 1..12:
	for i2 in 1..12:
		var index = (12 * (i - 1)) + i2

		highlight_cells[index] = new(hightlight_cell_type)

		#pieces_cells[index].color = color
		highlight_cells[index].image = gtk3.newImage()



# Attach color grid to board
