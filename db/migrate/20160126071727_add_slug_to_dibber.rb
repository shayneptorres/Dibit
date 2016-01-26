class AddSlugToDibber < ActiveRecord::Migration
  def change
    add_column :dibbers, :slug, :string
    add_index :dibbers, :slug
  end
end
