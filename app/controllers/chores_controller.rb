class ChoresController < ApplicationController
  
 
  
  def create
    @user = User.find(params[:chore][:user_id])
    @chore = @user.chores.create(chore_params)
    @chore.save
    redirect_to user_path(@user.id)
  end
  
  def update
    @chore = Chore.find(params[:id])
    if @chore.done == "false"
      @chore.done ="true"
      @chore.save
      redirect_to user_path(session[:user_id])
    else
      @chore.done ="false"
      @chore.save
      redirect_to user_path(session[:user_id])
    end
  end
  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
    redirect_to user_path(session[:user_id])
  end
  
  


  # chore params method
  def chore_params
    params[:chore].permit(:name, :done)
  end

end

