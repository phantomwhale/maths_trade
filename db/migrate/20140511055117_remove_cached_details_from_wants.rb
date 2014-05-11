class RemoveCachedDetailsFromWants < ActiveRecord::Migration
  def change
    remove_column :wants, :seller, :string
    remove_column :wants, :game_id, :integer
  end
end
