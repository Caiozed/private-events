class UsersController < ApplicationController
	before_action :correct_user, only: [:show]

  def new
  	@user = User.new
  end

  def create 
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  def show
  	@events = current_user.events 
 		@user = @events.first.creator
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email)
  end

end
