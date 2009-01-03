spec = Gem::Specification.new do |s|
  s.name = "popen4"
  s.version = '0.1.2'
  s.author = "John-Mason P. Shackelford"
  s.email = "john-mason@shackelford.org"
  s.platform = 'unix'
  s.summary = "Open4 cross-platform"
  s.files = ['Rakefile','lib/popen4.rb']
  s.test_files = ['tests/popen4_test.rb']
  s.extra_rdoc_files = %w(CHANGES LICENSE README.rdoc)
# s.require_path = "lib"
# s.autorequire = "popen4.rb"
  s.has_rdoc = true
  s.add_dependency("Platform", [">= 0.4.0"])
  s.add_dependency("open4", [">= 0.4.0"])

end
 


