#? replace(sub = "\t", by = " ")


import os  # to receive folder of program
import strutils  # to deal with strings




# defining main variables
include ./settings_types.nim
let settings_file_address = getAppDir() & r"/settings/settings.txt"










proc read_settings(rs_settings_to_read: string) {.discardable.} =
	#[Reads settings from file ""./settings/settings.txt"
	and writes them to their variables.]#


	for line in splitLines(rs_settings_to_read):
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

		elif words[0] == "test value":
			if words[1] == "test1":
				test_value = type_test_value.test1
			elif words[1] == "test2":
				test_value = type_test_value.test2
			elif words[1] == "nothing":
				test_value = type_test_value.nothing

		else:
			echo "Warning: found unknown setting type ($1) in $f_settings_file_addr".format(
				$words[0], "f_settings_file_addr", settings_file_address)




proc create_default_settings_file(): bool {.discardable.} =
	#[if file with settings is absent - we will create it.

	If file was successfully written - returns True,
	if not - False.]#

	try:
		writeFile(settings_file_address, default_settings)
		result = true
	except IOError:
		echo "Cannot write file with settings."
		result = false










read_settings(default_settings)


var
	settings_string: string  # here will be result of reading

try:
	echo "Reading settings."
	settings_string = readFile(settings_file_address)
	read_settings(settings_string)
except IOError:
	echo "Cannot read settings file."
	echo "Creating settings file with default values."
	create_default_settings_file()
