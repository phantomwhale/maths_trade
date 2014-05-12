class WantsController < ApplicationController

  def index
    @wants = Want.where(:user => current_user).order('list_entry_id')
  end

  def create
    Want.create!(user: current_user, list_entry_id: params[:list_entry_id])
    respond_to do |format|
      format.html { redirect_to geek_list_path(GeekList::AUSSIE_MID_YEAR_2014_ID), notice: "Added item #{params[:list_entry_id]} to want list" }
      format.json { render :json => '{ "status" : "ok" }' }
    end
  end

  def destroy
    Want.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to wants_path, notice: "Removed item #{params[:id]} from want list" }
      format.json { render :json => '{ "status" : "ok" }' }
    end
  end
end
