require 'yaml'

module AddSymbolicNames
  module Store
    class Yaml
      mattr_accessor :folder

      def self.define_constants(klass, opts)
        YAML.load_file(File.join(self.folder, "#{klass.name.demodulize.tableize}.yml")).each do |datum|
          klass.const_set(datum['symbolic_name'], datum['id']) unless klass.const_defined?(datum['symbolic_name'])
        end
      end
    end
  end
end