class UsersController < ApplicationController
  def send_request
    @target = User.find(params[:id])
    current_user.friend_request(@target)
    redirect_to profile_path(@target)
  end

  def pending_requests
    @p_requests = current_user.requested_friends
  end

  def accept_request
    @target = User.find(params[:id])
    current_user.accept_request(@target)
    redirect_to profile_path(@target)
  end

  def decline_request
    @target = User.find(params[:id])
    current_user.decline_request(@target)
    redirect_to profile_path(@target)
  end
end
