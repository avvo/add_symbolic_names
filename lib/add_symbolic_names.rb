module AddSymbolicNames
  mattr_accessor :default_store
  self.default_store = :active_record

  autoload :Mixin, 'add_symbolic_names/mixin'
  autoload :Store, 'add_symbolic_names/store'
end

require 'add_symbolic_names/railtie' if defined? Rails