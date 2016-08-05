require 'yaml'

module AddSymbolicNames
  module Store
    class Yaml
      mattr_accessor :folder

      def self.define_constants(klass, opts)
        YAML.load_file(yaml_file_name(klass)).each do |datum|
          klass.const_set(datum['symbolic_name'], datum['id']) unless klass.const_defined?(datum['symbolic_name'])
        end
      end

      def self.yaml_file_name(klass)
        File.join(self.folder, "#{klass.name.tableize}.yml")
      end
    end
  end
end
