class AddSuperAdminToDibbers < ActiveRecord::Migration
  def change
    add_column :dibbers, :super_admin, :boolean
    add_column :dibbers, :super_admin_password, :string
  end
end
