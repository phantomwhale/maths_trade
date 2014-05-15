class AddPositionToWants < ActiveRecord::Migration
  def change
    add_column :wants, :position, :integer
  end
end
