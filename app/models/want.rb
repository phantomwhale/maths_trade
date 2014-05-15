class Want < ActiveRecord::Base
  acts_as_list

  validates :user, :list_entry_id, presence: true
  validates_uniqueness_of :list_entry_id, :scope => :user_id
  validates :cash_offer, numericality: { only_integer: true, greater_than: 0, 
                                         unless: Proc.new { |trade_row| trade_row.cash_offer.nil? } }

  belongs_to :user

  delegate :game_id, :index, :name, :owner, :trade_code, :to => :list_entry

  def list_entry
    @list_entry ||= Bgg.geek_list.list_entry(list_entry_id)
  end
end
