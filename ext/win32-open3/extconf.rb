require "mkmf"
require "ftools"

File.copy("ext/open3.c",".")
File.copy("ext/open3.h",".")

have_type("rb_pid_t", "ruby.h") # For 1.8.3 and later
create_makefile("win32/open3")