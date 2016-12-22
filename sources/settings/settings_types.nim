#? replace(sub = "\t", by = " ")


#[This file is not module - it includes to settings.nim file (sources/settings/settings.nim).
Here types for settings are enumerated.
]#




const default_settings_text = """
# Lines, started with "#" are ignored. They are used for tips.

color scheme: green
# availible values: general, classic, gray, green

test value: nothing
# availible values: test1, test2, nothing

cell size: 25
#specified cell size of board in pixels
"""




type type_color_scheme {.pure.} =
	#[general - as on wikipedia (brown light, brown dark),
	classic - black and white,
	gray - gray light and gray dark,
	green - green light and green dark
	]#
	enum general, classic, gray, green





type type_test_value {.pure.} =
	#[just a value for testing]#
	enum test1, test2, nothing





var
	color_scheme*: type_color_scheme
	test_value*: type_test_value
	cell_size*: int
