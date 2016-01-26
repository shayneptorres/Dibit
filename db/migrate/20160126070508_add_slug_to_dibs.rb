class AddSlugToDibs < ActiveRecord::Migration
  def change
    add_column :dibs, :slug, :string
    add_index :dibs, :slug
  end
end
