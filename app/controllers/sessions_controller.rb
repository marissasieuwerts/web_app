class SessionsController < ApplicationController

  def new
  end

 def create
    user = User.find_by(student_id: params[:session][:student_id])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid student ID/password combination'
      render 'new'
    end
  end

	def destroy
    	sign_out
    	redirect_to root_url
  	end
end