class AddPasswordDigestToDibbers < ActiveRecord::Migration
  def change
    add_column :dibbers, :password_digest, :string
  end
end
