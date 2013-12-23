class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  
  def show
  	@user = current_user
	@courses = current_user.courses
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user } 
    end  
  end
  
 def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to UvA courses!"
      redirect_to @user
    else
      render 'new'
    end
  end

 def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:student_id, :password,
                                   :password_confirmation)
    end
end
