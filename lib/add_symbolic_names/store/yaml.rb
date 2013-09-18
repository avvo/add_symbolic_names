require 'yaml'

module AddSymbolicNames
  module Store
    class Yaml
      def self.define_constants(klass, opts)
        YAML.load_file(File.join(Rails.root, "db/domain/#{klass.name.demodulize.tableize}.yml")).each do |datum|
          klass.const_set(datum['symbolic_name'], datum['id']) unless klass.const_defined?(datum['symbolic_name'])
        end
      end
    end
  end
end