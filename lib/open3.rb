# If both binary versions of the open3.so are available select which to execute
# on the basis of the Ruby version, otherwise require the one we have. We do 
# this so that we can run unit tests while packaging, but so that packages
# contain only one version of the lib. We do not want to use the version 
# guessing at runtime since we are making the decision on the basis of the 
# one-click installer's history with the result that we will guess wrong for 
# users who build their own Ruby install for win32.

LIB_184VC6 = File.join( File.dirname(__FILE__), "1.8.4_VC6/open3.so" )
LIB_182VC7 = File.join( File.dirname(__FILE__), "1.8.2_VC7/open3.so" )
LIB_BUILT  = File.join( File.dirname(__FILE__), "./open3.so" )

if File.exists?( LIB_184VC6 ) &&
   File.exists?( LIB_182VC7 ) 
  
  case VERSION
    when "1.8.2"
      require LIB_182VC7
    when "1.8.4"
      require LIB_184VC6    
  end

elsif File.exists?( LIB_BUILT )
  require LIB_BUILT

elsif File.exists?( LIB_184VC6 )
  require LIB_184VC6

elsif File.exists?( LIB_182VC7 ) 
  require LIB_182VC7

end