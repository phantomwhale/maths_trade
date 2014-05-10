class LoginRequestController < ApplicationController
  def create
    @user = User.where(:username => params[:username]).first_or_create
    #TODO send a geekmail with a login link. Until then, log us in...
    session[:current_user_id] = @user.id
    redirect_to tradelist_path(172859)
  end
end
