class TradelistController < ApplicationController
  before_filter :authenticate_user!

  def show 
    file = Bgg.adapter.geeklist(params[:id])
    @geeklist = GeekList.new(Nokogiri::XML(file))
    @current_user = current_user
  end
end
