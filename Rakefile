require 'rubygems'
require 'rubygems/user_interaction'
require 'rake/gempackagetask'
require 'rake/testtask'
require 'rake/rdoctask'

PROJECT_VERSION = "0.1.0"

task :default => [:test]

# Test --------------------------------------------------------------------

desc "Run the unit tests"
task :test do
  Rake::TestTask.new("test") do |t|
    t.libs << "tests"
    t.pattern = 'tests/*_test.rb'
    t.verbose = true
  end
end

# Documentation -----------------------------------------------------------
desc "Generate RDoc"
rd = Rake::RDocTask.new("rdoc") { |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = "POpen4 -- Open4 cross-platform"
  rdoc.options << '--main' << 'README'
  rdoc.rdoc_files.include('README', 'LICENSE', 'CHANGES')
  rdoc.rdoc_files.include('lib/**/*.rb', 'doc/**/*.rdoc').exclude('lib/open3.rb')
}

# GEM Packaging -----------------------------------------------------------

POPEN4_GENERIC = FileList["{tests,lib}/popen4*.rb"].add('*').to_a

# -- WIN32 1.8.2 ----------------

spec = Gem::Specification.new do |s|
  s.name          = "POpen4"
  s.version       = PROJECT_VERSION
  s.author        = "John-Mason P. Shackelford"
  s.email         = "john-mason@shackelford.org"
  s.platform      = 'win32-1.8.2-VC7'
  s.summary       = "Open4 cross-platform"
  s.files         = POPEN4_GENERIC + FileList['lib/1.8.2*/*', 'lib/open3.rb'].to_a
  s.require_path  = "lib"
  s.autorequire   = "popen4.rb"
  s.has_rdoc      = true
  s.add_dependency("Platform",   ">= 0.4.0")    
end

task :package => [:test]
Rake::GemPackageTask.new( spec ) do |pkg|
  pkg.gem_spec = spec
  pkg.need_zip = false
  pkg.need_tar = false
end

# -- WIN32 1.8.4 ----------------

spec = Gem::Specification.new do |s|
  s.name          = "POpen4"
  s.version       = PROJECT_VERSION
  s.author        = "John-Mason P. Shackelford"
  s.email         = "john-mason@shackelford.org"
  s.platform      = 'win32-1.8.4-VC6'
  s.summary       = "Open4 cross-platform"
  s.files         = POPEN4_GENERIC + FileList['lib/1.8.4*/*', 'lib/open3.rb'].to_a
  s.require_path  = "lib"
  s.autorequire   = "popen4.rb"
  s.has_rdoc      = true
  s.add_dependency("Platform",   ">= 0.4.0")    
end

task :package => [:test]
Rake::GemPackageTask.new( spec ) do |pkg|
  pkg.gem_spec = spec
  pkg.need_zip = false
  pkg.need_tar = false
end

# -- WIN32 src-only ----------------

spec = Gem::Specification.new do |s|
  s.name          = "POpen4"
  s.version       = PROJECT_VERSION
  s.author        = "John-Mason P. Shackelford"
  s.email         = "john-mason@shackelford.org"
  s.platform      = 'win32-source'
  s.summary       = "Open4 cross-platform"
  s.files         = POPEN4_GENERIC + FileList['{ext}/**/*','lib/open3.rb'].to_a
  s.require_path  = "lib"
  s.autorequire   = "popen4.rb"
  s.has_rdoc      = true
  s.add_dependency("Platform",   ">= 0.4.0")
  s.extensions << 'ext/win32-open3/extconf.rb'   
end

task :package => [:test]
Rake::GemPackageTask.new( spec ) do |pkg|
  pkg.gem_spec = spec
  pkg.need_zip = false
  pkg.need_tar = false
end

# -- Unix / OS X / BSD / Linux ----------------

spec = Gem::Specification.new do |s|
  s.name          = "POpen4"
  s.version       = PROJECT_VERSION
  s.author        = "John-Mason P. Shackelford"
  s.email         = "john-mason@shackelford.org"
  s.platform      = 'unix'
  s.summary       = "Open4 cross-platform"
  s.files         = POPEN4_GENERIC 
  s.require_path  = "lib"
  s.autorequire   = "popen4.rb"
  s.has_rdoc      = true
  s.add_dependency("Platform",   ">= 0.4.0")
  s.add_dependency("open4",     ">= 0.4.0")  
end

task :package => [:test]
Rake::GemPackageTask.new( spec ) do |pkg|
  pkg.gem_spec = spec
  pkg.need_zip = false
  pkg.need_tar = false
end



