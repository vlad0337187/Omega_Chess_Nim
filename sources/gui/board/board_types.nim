#? replace(sub = "\t", by = " ")

#[ All types, that will be used with board.
]#




type colors_type = enum  # Needed to specify cell types
	light, dark

type pieces = enum
	light_pawn, dark_pawn, light_horse, dark_horse, light_elephant, dark_elephant,
	light_rook, dark_rook, light_defender, dark_defender, light_wizard, dark_wizard,
	light_vizir, dark_vizir, light_king, dark_king, light_joker, dark_joker

type highlight_color_type = enum
	green, yellow, red





type cell_type = object of RootObj
	color: colors_type
	image: gtk3.Image


type board_cell_type = object of cell_type

type piece_cell_type = object of cell_type
	name: string

type hightlight_cell_type = object of cell_type
	highlight_color: highlight_color_type




var dummy_error: GError










#type board_cells_svg_image_type = object of RootObj
#	svg: rsvg.RsvgHandle
# unixToNativePath
echo "APP DIR:", getAppDir() & "/images/cells/general_light.svg"
var board_light_cell_svg = rsvg.rsvgNewFromFile(cstring(os.getAppDir() & "/images/cells/general_light.svg"), dummy_error)
#echo "exists file or no?", existsFile(os.getAppDir() & "/images/cells/general_light.svg")
#var testhandle = rsvg.rsvgNewFromFile(os.getAppDir() & "/images/cells/general_light.svg", dummy_error)

echo "Closing: ", rsvg.rsvgHandleClose(board_light_cell_svg, dummy_error)



discard rsvg.rsvgHandleGetPixbuf(board_light_cell_svg)










proc fill_cell_with_new_image  (cell:ref cell_type,  image_name:string)  {.discardable.} =
	#[ Fills given cell's image field with specified in "image_name".
	]#

	var image = gtk3.newImage()
	var pixbuf: gdk_pixbuf.GdkPixbuf =
		gdk_pixbuf.newPixbufFromFileAtSize(os.getAppDir() & image_name, cell_size.cint(), cell_size.cint(), dummy_error)

	image.setFromPixbuf(pixbuf)

	cell.image = image




proc change_cell_image  (cell:ref cell_type,  image_name:string)  {.discardable.} =
	#[ Do the same, as fill_cell_with_new_image(), but does not creates new image widget.
	]#

	var pixbuf: gdk_pixbuf.GdkPixbuf =
		gdk_pixbuf.newPixbufFromFileAtSize(os.getAppDir() & image_name, cell_size.cint(), cell_size.cint(), dummy_error)

	cell.image.setFromPixbuf(pixbuf)



proc some_text  ()  {.discardable.} =
	echo "Some text"
