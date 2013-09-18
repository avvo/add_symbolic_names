module AddSymbolicNames
  module Store
    class ActiveRecord
      def self.define_constants(klass, opts)
        symbolic_name_attr = opts.fetch(:symbolic_name_attrib, :symbolic_name)
        value_attr = opts.fetch(:value_attrib, :id)
        klass.all.each do |record|
          symbolic_name = record.send(symbolic_name_attrib)
          value = record.send(value_attr)

          klass.const_set(symbolic_name, value) unless klass.const_defined?(symbolic_name)
        end
      end
    end
  end
end