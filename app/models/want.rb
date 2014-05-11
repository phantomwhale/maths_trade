class Want < ActiveRecord::Base
  validates :user, :list_entry_id, presence: true
  validates_uniqueness_of :list_entry_id, :scope => :user_id
  belongs_to :user

  def game_name
    Bgg.game_entry(game_id).name
  end 
end
