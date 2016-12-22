#? replace(sub = "\t", by = " ")


import strutils  # to deal with strings
import os  # to receive current directory





include ./settings_types.nim  # Contains default values, types


# defining main variables:
let settings_file_address = os.getAppDir() & r"/settings/settings.txt"










proc parse_settings(ps_settings_to_parse: string) {.discardable.} =
	#[ Reads settings from file ""./settings/settings.txt"
	and writes them to their variables.

	NEW settings add here, declare them in settings_types.nim !

	Launches from read_settings().
	]#


	for line in splitLines(ps_settings_to_parse):
		#echo "line: ", line
		if line.startsWith('#'):
			continue
		elif line.isNilOrEmpty():
			continue

		var words = line.split(": ")

		if words[0] == "color scheme":
			if words[1] == "general":
				color_scheme = type_color_scheme.general
			elif words[1] == "classic":
				color_scheme = type_color_scheme.classic
			elif words[1] == "gray":
				color_scheme = type_color_scheme.gray
			elif words[1] == "green":
				color_scheme = type_color_scheme.green
			else:
				echo "Unknown value for color scheme. Passing."

		elif words[0] == "test value":
			if words[1] == "test1":
				test_value = type_test_value.test1
			elif words[1] == "test2":
				test_value = type_test_value.test2
			elif words[1] == "nothing":
				test_value = type_test_value.nothing
			else:
				echo "Unknown value for test value. Passing."

		elif words[0] == "cell size":
			try:
				cell_size = parseInt(words[1])
			except ValueError:
				echo "Unknown value for cell size. It must be integer number. Passing."

		else:
			echo "Warning: found unknown setting type ($1) in $f_settings_file_addr".format(
				$words[0], "f_settings_file_addr", settings_file_address)





proc create_default_settings_file(): bool {.discardable.} =
	#[if file with settings is absent - we will create it.

	If file was successfully written - returns True,
	if not - False.

	Launches from read_settings().
	]#

	try:
		writeFile(settings_file_address, default_settings_text)
		result = true
	except IOError:
		echo "Cannot write file with settings."
		result = false





proc read_settings*() {.discardable.} =
	#[ Reads and parses default settings, after this overrides them with user settings.
	If file with user settings is absent - it creates it.

	Main function, launches all other functions.
	]#
	var
		settings_string: string  # here will be result of reading

	parse_settings(default_settings_text)
	try:
		echo "Reading settings."
		settings_string = readFile(settings_file_address)
		parse_settings(settings_string)
	except IOError:
		echo "Cannot read settings file."
		echo "Creating settings file with default values."
		create_default_settings_file()












read_settings()
