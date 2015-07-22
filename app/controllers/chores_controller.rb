class ChoresController < ApplicationController
  
  def create
    
    @chore = Chore.new(chore_params)
    @chore.done = false
    if @chore.save
      redirect_to user_path(session[:user_id]) 
    else
      @error = true
      redirect_to new_chore_path
    end
  end
end


# chore params method
def chore_params
  params[:chore].permit(:name)
end
