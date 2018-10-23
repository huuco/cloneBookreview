class RelationshipsController < ApplicationController
  def create
    @user = User.find_by id: params[:followed_id]
    if current_user.follow @user
      flash[:success] = t "flash.follow_success"
    else
      flash[:danger] = t "flash.follow_fail"
    end
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow @user
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end
end
