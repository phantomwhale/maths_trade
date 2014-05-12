class Want < ActiveRecord::Base
  validates :user, :list_entry_id, presence: true
  validates_uniqueness_of :list_entry_id, :scope => :user_id
  belongs_to :user

  delegate :game_id, :index, :name, :owner, :trade_code, :to => :list_entry

  def list_entry
    @list_entry ||= Bgg.geek_list(GeekList::AUSSIE_MID_YEAR_2014_ID).list_entry(list_entry_id)
  end
end
