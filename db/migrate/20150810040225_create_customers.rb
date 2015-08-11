class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
    add_index :customers, :name, unique: true
    add_index :customers, :code, unique: true
  end
end
