spec = Gem::Specification.new do |s|
  s.name = "popen4"
  s.version = '0.1.2'
  s.date     = "2009-01-03"
  s.summary = "Open4 cross-platform"
  s.email = "john-mason@shackelford.org"
  s.homepage = "http://github.com/shairontoledo/popen4"
  s.description = "POpen4 provides the Rubyist a single API across platforms for executing a command in a child process with handles on stdout, stderr, stdin streams as well as access to the process ID and exit status."
  s.has_rdoc = true
  s.authors = ["John-Mason P. Shackelford"]
  s.files = ['Rakefile','lib/popen4.rb']
  s.test_files = ['tests/popen4_test.rb']
  s.extra_rdoc_files = %w(CHANGES LICENSE README.rdoc)
  s.add_dependency("Platform", [">= 0.4.0"])
  s.add_dependency("open4", [">= 0.4.0"])
end
 
