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

end
