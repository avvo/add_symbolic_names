module AddSymbolicNames
  module Store

    autoload :ActiveRecord, 'add_symbolic_names/store/active_record'
    autoload :Yaml, 'add_symbolic_names/store/yaml'

    def self.fetch(type)
      const_get(type.to_s.classify)
    end
  end
end