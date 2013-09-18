$:.push File.expand_path("../lib", __FILE__)

# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.

require 'add_symbolic_names/version'

Gem::Specification.new do |s|
  s.name = "add_symbolic_names"
  s.version = AddSymbolicNames::VERSION
  s.description = 'ActiveRecord plugin for creating constants from a domain table'
  s.summary = 'ActiveRecord plugin for creating constants from a domain table'
  s.add_dependency "activerecord", ">= 3.2.0"
  s.add_development_dependency "sqlite3"

  s.author = "Ben VandenBos"
  s.email = "bvandenbos@gmail.com"
  s.homepage = "http://github.com/avvo/add_symbolic_names"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir.glob('test/*_test.rb')
end
