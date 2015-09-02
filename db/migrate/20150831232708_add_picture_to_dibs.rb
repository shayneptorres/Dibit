class AddPictureToDibs < ActiveRecord::Migration
  def change
    add_column :dibs, :picture, :string
  end
end
