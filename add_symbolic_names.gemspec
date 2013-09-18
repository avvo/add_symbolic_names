# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.

require 'add_symbolic_names/version'

Gem::Specification.new do |s|
  s.name = "add_symbolic_names"
  s.version = AddSymbolicNames::VERSION
  s.description = 'ActiveRecord plugin for creating constants from a domain table'
  s.summary = 'ActiveRecord plugin for creating constants from a domain table'
  s.add_dependency "activerecord", ">= 3.2.0"

  s.author = "Ben VandenBos"
  s.email = "bvandenbos@gmail.com"
  s.homepage = "http://github.com/avvo/add_symbolic_names"
  s.has_rdoc = true

  s.files = `git ls-files`.split("\n")
  s.test_files = Dir.glob('test/*_test.rb')
end
