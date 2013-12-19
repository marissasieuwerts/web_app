class RelationshipsController < ApplicationController

  def create
    @course = Course.find(params[:relationship][:followed_id])
    current_user.follow!(@course)
    redirect_to courses_path
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@course)
    redirect_to courses_path
  end
end