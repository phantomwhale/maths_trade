class TradelistController < ApplicationController
  def show 
    file = Bgg.adapter.geeklist(params[:id])
    @geeklist = GeekList.new(Nokogiri::XML(file))
  end
end
