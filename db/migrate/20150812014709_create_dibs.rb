class CreateDibs < ActiveRecord::Migration
  def change
    create_table :dibs do |t|
      t.string :name
      t.text :note
      t.timestamps
    end
  end
end
