class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
  end

  def create
    if @user = User.find_by_token(params(:token)) 
      session[:current_user_id] = @user.id
      #TODO lets just go straight to the trade list for now
      redirect_to geek_list_path(GeekList::AUSSIE_MID_YEAR_2014_ID)
    else
      #TODO add an error
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
