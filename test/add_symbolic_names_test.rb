require 'test_helper'

class AddSymbolicNamesTest < ActiveSupport::TestCase

  test "loading from ActiveRecord" do
    assert_equal 1, UserCreationMethod::EMAIL
    assert_equal 2, UserCreationMethod::REGISTER
    assert_equal 3, UserCreationMethod::IMPORT
  end

  test "loading alternate column names" do
    assert_equal "Washington", State::WA
    assert_equal "Oregon", State::OR
    assert_equal "California", State::CA
  end

  test "loading from yaml" do
    assert_equal 1, User::UNKNOWN
    assert_equal 2, User::ADMIN
  end

  test "generates a yaml file name based off of the class name" do
    class ClassWithoutModule
    end
    yaml_store = AddSymbolicNames::Store::Yaml

    assert_equal "#{yaml_store.folder}/#{self.class.name.underscore}/class_without_modules.yml", yaml_store.yaml_file_name(ClassWithoutModule)
  end

  test "generates a yaml file name based off of the class name with modules" do
    module SomeModule
      class ClassWithModule
      end
    end
    yaml_store = AddSymbolicNames::Store::Yaml

    assert_equal "#{yaml_store.folder}/#{self.class.name.underscore}/some_module/class_with_modules.yml", yaml_store.yaml_file_name(SomeModule::ClassWithModule)
  end

end
