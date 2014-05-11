class TradeListsController < ApplicationController
  before_filter :authenticate_user!

  def show 
    file = Bgg.adapter.geeklist(params[:id])
    geek_list = GeekList.new(Nokogiri::XML(file))
    @trade_list = TradeListPresenter.new(geek_list, current_user)
  end
end

class TradeListPresenter
  def initialize(geeklist, current_user)
    @geek_list = geeklist
    @wants = current_user.wants.collect(&:list_entry_id)
  end

  def games
    p @wants
    @geek_list.games.map do |game|
      p [game.list_entry_id.to_i, @wants.include?(game.list_entry_id.to_i)]
      game.extend(WantStatus).wanted = @wants.include?(game.list_entry_id.to_i)
      game
    end
  end

  module WantStatus
    attr_accessor :wanted
    alias :wanted? :wanted
  end
end
