class ChoresController < ApplicationController
  
 
  
  def create
    @user = User.find(params[:chore][:user_id])
    @chore = @user.chores.create(chore_params)
    @chore.save
    redirect_to user_path(@user.id)
  end


# chore params method
def chore_params
  params[:chore].permit(:name, :done)
end

end

