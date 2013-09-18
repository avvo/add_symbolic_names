class User < ActiveRecord::Base
  belongs_to :user_creation_method

  add_symbolic_names store: :yaml
end
