#? replace(sub = "\t", by = " ")


#[This file is not module - it includes to settings.nim file (modules/settings/settings.nim).
Here types for settings are enumerated.
]#




type type_color_scheme {.pure.} =
	#[general - as on wikipedia (brown light, brown dark),
	classic - black and white,
	gray - gray light and gray dark,
	green - green light and green dark
	]#
	enum general, classic, gray, green

var color_scheme: type_color_scheme




type type_test_value {.pure.} =
	#[just a value for testing]#
	enum test1, test2, nothing

var test_value: type_test_value
