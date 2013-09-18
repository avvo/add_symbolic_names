module AddSymbolicNames
  module Mixin
    extend ActiveSupport::Concern

    module ClassMethods
      
      def add_symbolic_names(opts = {})
        store = Store.fetch(opts.fetch(:store) { AddSymbolicNames.default_store })

        store.define_constants(self, opts)
      end
      
    end
  end  
end
