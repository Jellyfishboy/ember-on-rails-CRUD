class RecreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.text :quote

      t.timestamps
    end
  end
end
