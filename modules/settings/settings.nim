#? replace(sub = "\t", by = " ")


import os  # to receive folder of program
import strutils  # to deal with strings


include ./settings_types.nim



proc read_settings() {.discardable.} =
	#[Reads settings from file ""./settings/settings.txt"
	and writes them to their variables.]#

	var settings_file_address: string = joinPath(getAppDir(), r"/settings/settings.txt")


	for line in splitLines(readFile(settings_file_address)):
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
			echo "Warning: found unknown setting type ($1) in ./settings/settings.txt".format($words[0])


read_settings()
echo "color scheme is ", color_scheme, "\ntest value has value: ", test_value
