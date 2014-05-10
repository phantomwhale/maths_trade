class AddGameObjectIdToWants < ActiveRecord::Migration
  def change
    add_column :wants, :game_objectid, :string
    add_column :wants, :seller, :string
  end
end
