class WantController < ApplicationController
  before_filter :authenticate_user!

  def create
    Want.create!(user: current_user, game_id: params[:game_id])
    
    respond_to do |format|
      format.html { redirect_to tradelist_path(172859), notice: "Added item #{params[:game_id]} to want list" }
      format.json { render :json => '{ "status" : "ok" }' }
    end
  end
end
