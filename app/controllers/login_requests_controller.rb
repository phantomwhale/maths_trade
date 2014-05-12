class LoginRequestsController < ApplicationController
  skip_before_filter :authenticate_user!

  def create
    @user = User.where(:username => params[:username]).first_or_create
    #TODO send a geekmail with a login link. Until then, log us in...
    sign_in(@user)
    redirect_to geek_list_path(GeekList::AUSSIE_MID_YEAR_2014_ID)
  end
end
