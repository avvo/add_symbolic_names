module AddSymbolicNames
  class Railtie < ::Rails::Railtie
    config.add_symbolic_names = ActiveSupport::OrderedOptions.new
    config.add_symbolic_names.default_store = nil

    initializer 'add_symbolic_names' do |app|
      puts "in initializer"
      AddSymbolicNames.default_store = app.config.add_symbolic_names.default_store if app.config.add_symbolic_names.default_store
      ActiveSupport.on_load(:active_record) do
        include AddSymbolicNames::Mixin
      end
    end

  end
end