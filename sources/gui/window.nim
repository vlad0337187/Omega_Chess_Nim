#? replace(sub = "\t", by = " ")




#echo "Window.nim is loaded."
import ./gtk/gtk3, ./gtk/gdk_pixbuf  # for GUI
import ./gtk/gobject  # for connecting to signals
import ./gtk/glib  # for gerror
import ./gtk/rsvg

gtk3.initWithArgv()



# Forward declarations:
proc resize_window () {.discardable, procvar.}



# We create a window
var main_window = gtk3.newWindow()
main_window.title = "Testwindow"
main_window.setDefaultSize(640, 640)
main_window.title = "Omega chess in Nim and GTK 3"
discard gobject.gSignalConnect(main_window, "size-allocate", cast[GCallback](resize_window), nil)
discard gobject.gSignalConnect(main_window, "destroy", cast[GCallback](mainQuit), nil)


include ./board/board.nim



proc resize_window () =
	echo "shit"



gtk3.add(main_window, board_window_scrollable)  # widget "board_window_scrollable" is from board.nim


main_window.showAll()
gtk3.main()
