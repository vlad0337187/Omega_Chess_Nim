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
	image: gtk3.Image


type board_cell_type = object of cell_type
	cell_color: colors_type

type piece_cell_type = object of cell_type
	piece_color: colors_type
	name: string

type hightlight_cell_type = object of cell_type
	highlight_color: highlight_color_type


type pseudobutton_type = object of RootObj
	button: gtk3.EventBox




var dummy_error: GError








discard """"import ../gtk/cairo.nim

var
	board_light_cell_svg = rsvg.rsvgNewFromFile(cstring(os.getAppDir() & "/images/cells/general_light.svg"), dummy_error)

	current_format = cairo.Format.ARGB32
	surface = imageSurfaceCreate(current_format, cint(12), cint(15))
	context_with_cell = cairo.create(surface)"""


#cairo.setSourceRgb(context_with_cell, cdouble(255), cdouble(0), cdouble(0))
#cairo.scale(contexst_with_cell, cdouble(5), cdouble(5))
discard """cairo.paint(context_with_cell)
discard rsvg.rsvgHandleRenderCairo(board_light_cell_svg, surface)"""


#type board_cells_svg_image_type = object of RootObj
#	svg: rsvg.RsvgHandle
# unixToNativePath
#echo "APP DIR:", getAppDir() & "/images/cells/general_light.svg"

#echo "exists file or no?", existsFile(os.getAppDir() & "/images/cells/general_light.svg")
#var testhandle = rsvg.rsvgNewFromFile(os.getAppDir() & "/images/cells/general_light.svg", dummy_error)

#echo "Closing: ", rsvg.rsvgHandleClose(board_light_cell_svg, dummy_error)



#discard rsvg.rsvgHandleGetPixbuf(board_light_cell_svg)
