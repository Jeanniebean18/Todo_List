class UsersController < ApplicationController
  
  def to_param  # overridden
    email
  end
  def home
    redirect_to users_path
  end
  
  def index
    @user = User.all
  end
  
  def new
    @user = User.new
  end
  
  def login
    @user = User.new
  end
  
  def logout
    session[:user_id] = nil
    redirect_to login_path
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
  
  def edit
    if session[:user_id] && session[:user_id] == params[:id].to_i
      @user = User.find(params[:id])
      render :edit
    else
      redirect_to user_path("#{session[:user_id]}")
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user.id)
  end
  
  def valid
    @user = User.where(email:params[:user][:email]).first
    if @user.nil?
      @error = true
      redirect_to login_path
    else
      user_password = BCrypt::Password.new(@user.password)
  
      if user_password == params[:user][:password]
        session[:user_id] = @user.id
        redirect_to profile_path # user_path(@user.id)
      else
        @error = true
        redirect_to login_path
      end
    end
  end
  
  def show
    if session[:user_id] # && session[:user_id] == params[:id].to_i
      @user = User.find(session[:user_id])
      render :profile
    else
      redirect_to login_path# user_path("#{session[:user_id]}")
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  # user params method
  def user_params
    params[:user].permit(:email, :password)
  end
  
 
end
