# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.

Gem::Specification.new do |s|
  s.name = "add_symbolic_names"
  s.version = "0.0.1"
  s.description = 'ActiveRecord plugin for creating constants from a domain table'
  s.summary = 'ActiveRecord plugin for creating constants from a domain table'
  s.add_dependency "activerecord"

  s.author = "Ben VandenBos"
  s.email = "bvandenbos@gmail.com"
  s.homepage = "http://github.com/bvandenbos/add_symbolic_names"
  s.has_rdoc = true

  s.files = `git ls-files`.split("\n")
  s.test_files = Dir.glob('test/*_test.rb')
end
