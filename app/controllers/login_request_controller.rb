class LoginRequestController < ApplicationController
  def create
    @user = User.where(:username => params[:username]).first_or_create
    #TODO send a geekmail with a login link. Until then, log us in...
    sign_in(@user)
    redirect_to tradelist_path(172859)
  end
end
