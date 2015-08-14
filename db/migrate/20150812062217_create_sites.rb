class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :type
      t.integer :total_users
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
