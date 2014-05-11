class Want < ActiveRecord::Base
  validates :user, :game_id, :list_entry_id, presence: true
  belongs_to :user

  def game_name
    game_entry.name
  end 

  private

  def game_entry
    @game_entry ||= GameEntry.new(Nokogiri::XML(Bgg.adapter.game(game_id)))
  end
end
