class CreateDibbers < ActiveRecord::Migration
  def change
    create_table :dibbers do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
