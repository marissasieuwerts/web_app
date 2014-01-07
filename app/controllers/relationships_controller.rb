class RelationshipsController < ApplicationController

  def create
    @course = Course.find(params[:relationship][:followed_id])
    current_user.follow!(@course)
    flash[:success] = "Course added"
    redirect_to courses_path
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@course)
    flash[:success] = "Course dropped"
    redirect_to courses_path
  end
end