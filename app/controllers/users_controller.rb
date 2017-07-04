class UsersController < ApplicationController
  before_action :require_login, except: [:index, :create]
  def index
    if logged_in?
      redirect_to "/bright_ideas"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome"
      redirect_to "/bright_ideas"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end
end
