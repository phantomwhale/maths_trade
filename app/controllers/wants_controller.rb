class WantsController < ApplicationController

  def index
    @wants = Want.where(:user => current_user).order('position')
  end

  def create
    Want.create!(user: current_user, list_entry_id: params[:list_entry_id])
    respond_to do |format|
      format.html { redirect_to geek_list_path(GeekList::AUSSIE_MID_YEAR_2014_ID), notice: "Added item #{params[:list_entry_id]} to want list" }
      format.json { render :json => '{ "status" : "ok" }' }
    end
  end

  def edit
    @want = Want.find(params[:id])
  end

  def update
    @want = Want.find(params[:id])
    cash_offer = params[:want][:cash_offer]
    @want.update_attributes!(cash_offer: cash_offer)
    render :show
  end

  def sort
    params[:want].each_with_index do |id, index|
      Want.where(id: id).update_all(position: index)
    end
    render nothing: true
  end

  def destroy
    Want.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to wants_path, notice: "Removed item #{params[:id]} from want list" }
      format.json { render :json => '{ "status" : "ok" }' }
    end
  end
end
