class AddRankingToDibs < ActiveRecord::Migration
  def change
    add_column :dibs, :rank, :integer
  end
end
