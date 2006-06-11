###########################################################################
# tc_open3.rb
#
# Test suite for the win32-open3 package.  Except for the
# 'test_open3_with_arguments' test and Open4 tests, this suite passes
# on Unix as well.
###########################################################################
#base = File.basename(Dir.pwd)
#if base == 'test' || base =~ /win32-open3/i
#   require 'ftools'
#   Dir.chdir('..') if base == 'test'
#   Dir.mkdir('win32') unless File.exists?('win32')
#   File.copy('open3.so', 'win32') if File.exists?('open3.so')
#   $LOAD_PATH.unshift Dir.pwd   
#   Dir.chdir('test') rescue nil
#end

require 'win32/open3'
require 'test/unit'

class TC_Win32_Open3 < Test::Unit::TestCase
   def setup
      @good_cmd = 'ver'
      @bad_cmd  = 'verb'
   end
   
   def test_open3_basic
      assert_respond_to(Open3, :popen3)
      assert_nothing_raised{ Open3.popen3(@good_cmd) }
      assert_nothing_raised{ Open3.popen3(@bad_cmd) }
   end
   
   def test_open4_basic
      assert_respond_to(Open4, :popen4)
      assert_nothing_raised{ Open4.popen4(@good_cmd) }
      assert_nothing_raised{ Open4.popen4(@bad_cmd) }
   end
   
   # This test would fail on other platforms
   def test_open3_with_arguments
      assert_nothing_raised{ Open3.popen3(@good_cmd, 't') }
      assert_nothing_raised{ Open3.popen3(@bad_cmd, 't') }
      assert_nothing_raised{ Open3.popen3(@good_cmd, 'b') }
      assert_nothing_raised{ Open3.popen3(@bad_cmd, 'b') }
      assert_nothing_raised{ Open3.popen3(@good_cmd, 't', false) }
      assert_nothing_raised{ Open3.popen3(@good_cmd, 't', true) }
   end
   
   def test_open3_handles
      arr = Open3.popen3(@good_cmd)
      assert_kind_of(Array, arr)
      assert_kind_of(IO, arr[0])
      assert_kind_of(IO, arr[1])
      assert_kind_of(IO, arr[2])
   end
   
   def test_open3_block
      assert_nothing_raised{ Open3.popen3(@good_cmd){ |pin, pout, perr| } }
      Open3.popen3(@good_cmd){ |pin, pout, perr|
         assert_kind_of(IO, pin)
         assert_kind_of(IO, pout)
         assert_kind_of(IO, perr)
      }
   end
   
   def test_open4_block
      assert_nothing_raised{ Open4.popen4(@good_cmd){ |pin, pout, perr, pid| } }
      Open4.popen4(@good_cmd){ |pin, pout, perr, pid|
         assert_kind_of(IO, pin)
         assert_kind_of(IO, pout)
         assert_kind_of(IO, perr)
         assert_kind_of(Fixnum, pid)
      }
   end
   
   def test_open4_return_values
      arr = Open4.popen4(@good_cmd)
      assert_kind_of(Array,arr)
      assert_kind_of(IO, arr[0])
      assert_kind_of(IO, arr[1])
      assert_kind_of(IO, arr[2])
      assert_kind_of(Fixnum, arr[3])
   end
   
   def test_handle_good_content
      fin, fout, ferr = Open3.popen3(@good_cmd)
      assert_kind_of(String, fout.gets)
      assert_nil(ferr.gets)
   end
   
   def test_handle_bad_content
      fin, fout, ferr = Open3.popen3(@bad_cmd)
      assert_kind_of(String, ferr.gets)
      assert_nil(fout.gets)
   end
   
   def test_process_status
      fin, fout, ferr, pid = Open4.popen4("ruby -e 'exit 1'")
      assert_equal(true, $?.exited?)
      assert_equal(1, $?.exitstatus)
      assert_equal(pid, $?.pid)
   end
   
   def teardown
      @good_cmd = nil
      @bad_cmd  = nil
   end
end