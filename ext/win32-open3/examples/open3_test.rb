##############################################################################
# open3_test.rb
#
# Test script for the win32-open3 package.
##############################################################################
if File.basename(Dir.pwd) == 'examples'
   require 'ftools'
   Dir.chdir '..'
   Dir.mkdir('win32') unless File.exists?('win32')
   File.copy('open3.so', 'win32')
   $LOAD_PATH.unshift Dir.pwd
   Dir.chdir('examples') rescue nil
end

require 'win32/open3'

cmd1 = 'ver'   # valid
cmd2 = 'verb'  # invalid
cmd3 = "ruby -e 'exit 1'" # valid, with explicit exit status

# Try each command as you like...
Open3.popen3(cmd3){ |io_in, io_out, io_err|
   error = io_err.gets 
   if error
      puts 'Error'
      break
   else
      output = io_out.gets
      puts 'Output: ' + output if output
   end
}

p $?
