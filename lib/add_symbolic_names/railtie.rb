module AddSymbolicNames
  class Railtie < ::Rails::Railtie
    config.add_symbolic_names = ActiveSupport::OrderedOptions.new
    config.add_symbolic_names.default_store = nil
    config.add_symbolic_names.yaml_folder = nil

    initializer 'add_symbolic_names' do |app|
      AddSymbolicNames.default_store = app.config.add_symbolic_names.default_store if app.config.add_symbolic_names.default_store
      AddSymbolicNames::Store::Yaml.folder = app.config.add_symbolic_names.yaml_folder || 
        File.join(config.root, "db/domain")

      ActiveSupport.on_load(:active_record) do
        include AddSymbolicNames::Mixin
      end
    end

  end
end