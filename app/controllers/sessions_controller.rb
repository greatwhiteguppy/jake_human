class SessionsController < ApplicationController
  before_action :require_login, except: [:create]
  def create
    #logging in
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/bright_ideas"
    else
      flash[:error] = "Invalid Combination"
      redirect_to "/"
    end
  end

  def destroy
    #logging out
    session.delete :user_id
    redirect_to "/"
  end
end
