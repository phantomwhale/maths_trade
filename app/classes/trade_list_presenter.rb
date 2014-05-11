class TradeListPresenter
  def initialize(geeklist, current_user)
    @geek_list = geeklist
    @wants = current_user.wants.collect(&:list_entry_id)
  end

  def name
    @geek_list.name
  end

  def games
    @geek_list.games.map do |game|
      game.extend(WantStatus).wanted = @wants.include?(game.list_entry_id.to_i)
      game
    end
  end

  module WantStatus
    attr_accessor :wanted
    alias :wanted? :wanted
  end
end
