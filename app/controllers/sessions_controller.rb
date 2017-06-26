class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email])
  	if @user
  		log_in @user, params[:session][:remember_me]
  		redirect_to root_path
  	else
  		flash[:danger] = "No user with this email"
  		render :mew
  	end  
  end

  def destroy
  	log_out
  	redirect_to root_path
  end
end
