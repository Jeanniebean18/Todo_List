class UsersController < ApplicationController
  
  def home
    redirect_to users_path
  end
  
  def index
    @user = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    the_password = BCrypt::Password.create(params[:user][:password])
    @user = User.new(user_params)
    @user.password = the_password
    if @user.save
      redirect_to login_path #should redirect to login after creating profile.
    else
      @error = true
      redirect_to new_user_path
    end
  end
  
  def login
    @user = User.new
  end
  
  def logout
    session[:user_id] = nil
    redirect_to login_path
  end
  
  
  # user params method
  def user_params
  params[:user].permit(:email, :password)
  end
  
  # chore params method
  def chore_params
  params[:chore].permit(:name, :done)
  end
  
end
