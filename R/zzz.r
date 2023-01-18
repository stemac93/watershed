.onLoad = function(libname, pkgname) {
	Sys.setenv("GRASS_VERBOSE"=0)
	library('rgrass')
	rgrass:use_sp()

	if(is.null(getOption("mc.cores")) && !grepl("[Ww]indows", Sys.info()['sysname'])) {
		message("For faster performance of some functions on a machine with lots of RAM, you can set")
		message("options(mc.cores = parallel::detectCores())")
	}

	## set of an environment to hold package globals
	assign("ws_env", new.env(), envir = parent.env(environment()))
	ws_env$rasters = list()
	ws_env$vectors = list()

	## Try to figure out where GRASS is located, warn the user if not found
	gisBase = "/Applications/GRASS-8.0.app/Contents/Resources"
}

