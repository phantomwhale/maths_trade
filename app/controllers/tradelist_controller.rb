class TradelistController < ApplicationController
  def show 
    file = Bgg::Local.geeklist(params[:id])
    @geeklist = GeekList.new(Nokogiri::XML(file))
  end
end
