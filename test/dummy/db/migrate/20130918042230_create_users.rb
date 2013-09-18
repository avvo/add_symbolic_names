class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user_creation_methods do |t|
      t.string :symbolic_name
      t.string :name
      t.timestamps
    end

    create_table :users do |t|
      t.belongs_to :user_creation_method
      t.timestamps
    end
  end
end
