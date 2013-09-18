class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user_creation_methods do |t|
      t.string :symbolic_name
      t.string :name
    end

    execute %{ INSERT INTO `user_creation_methods` (`symbolic_name`, `name`) VALUES ("EMAIL", "Email"), ("REGISTER", "Register"), ("IMPORT", "Import") }

    create_table :states do |t|
      t.string :name
      t.string :abbr
    end

    execute %{ INSERT INTO `states` (`name`, `abbr`) VALUES ("Washington", "WA"), ("Oregon", "OR"), ("California", "CA") }

    create_table :users do |t|
      t.string :name
      t.belongs_to :user_creation_method
      t.timestamps
    end
  end
end
