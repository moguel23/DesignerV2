class ChangeTypeToSites < ActiveRecord::Migration
  def change
    remove_column :sites, :type
    add_column :sites, :site_type, :string
  end
end
