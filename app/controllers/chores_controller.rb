class ChoresController < ApplicationController
  
  def create
    @user = User.find(params[:chore][:user_id])
    @user.chores.create(chore_params)
    redirect_to user_path(session[:user_id]) 
    end


# chore params method
def chore_params
  params[:chore].permit(:name, :done, :user_id)
end

end