class AddDibberIdToDibs < ActiveRecord::Migration
  def change
    add_column :dibs, :dibber_id, :integer
  end
end
