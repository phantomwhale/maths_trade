class ChangeObjectIdToListEntryIdOnWants < ActiveRecord::Migration
  def change
    remove_column :wants, :game_objectid, :string
    add_column :wants, :list_entry_id, :integer
  end
end
