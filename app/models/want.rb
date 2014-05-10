class Want < ActiveRecord::Base
  validates :user, :game_id, presence: true
  belongs_to :user
end
