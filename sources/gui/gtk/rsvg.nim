#? replace(sub = "\t", by = " ")
{.deadCodeElim: on.}


from gobject import GObject, GType, GObjectObj, GObjectClassObj
from glib import GError
from gdk_pixbuf import GdkPixbuf
from cairo import Surface


when defined(windows):
	const LIB_RSVG = "librsvg-2.dll"
elif defined(macosx):
	const LIB_RSVG = "libgdk_pixbuf-2.0.0.dylib"
else:
	const LIB_RSVG = "librsvg-2.so(|.2)"	# /usr/lib/x86_64-linux-gnu/librsvg-2.so.2

{.pragma: librsvg, cdecl, dynlib: LIB_RSVG.}





type
	RsvgHandle* = ptr RsvgHandleObj
	RsvgHandlePtr* = ptr RsvgHandleObj
	RsvgHandleObj* = object





proc rsvgHandleNew* ():  RsvgHandle  {.importc: "rsvg_handle_new", librsvg.}
proc rsvgNewFromFile* (filename: cstring, error: GError):  RsvgHandle  {.importc: "rsvg_handle_new_from_file", librsvg.}

proc rsvgHandleClose* (handle: RsvgHandle, error: GError):  bool  {.importc: "rsvg_handle_close", librsvg.}


proc rsvgHandleGetPixbuf* (handle: RsvgHandle): GdkPixbuf {.importc: "rsvg_handle_get_pixbuf", librsvg.}
proc rsvgHandleRenderCairo* (handle: RsvgHandle, surface: Surface): bool {.importc: "rsvg_handle_render_cairo", librsvg.}
