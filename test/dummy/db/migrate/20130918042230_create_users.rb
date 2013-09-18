class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user_creation_methods do |t|
      t.string :symbolic_name
      t.string :name
    end

    execute %{ INSERT INTO "user_creation_methods" (symbolic_name, name) VALUES ("EMAIL", "Email") }
    execute %{ INSERT INTO "user_creation_methods" (symbolic_name, name) VALUES ("REGISTER", "Register") }
    execute %{ INSERT INTO "user_creation_methods" (symbolic_name, name) VALUES ("IMPORT", "Import") }

    create_table :states do |t|
      t.string :name
      t.string :abbr
    end

    execute %{INSERT INTO states (name, abbr) VALUES ("Washington", "WA") }
    execute %{INSERT INTO states (name, abbr) VALUES ("Oregon", "OR") }
    execute %{INSERT INTO states (name, abbr) VALUES ("California", "CA") }

    create_table :users do |t|
      t.string :name
      t.belongs_to :user_creation_method
      t.timestamps
    end
  end
end
