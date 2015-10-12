class UsersController < ApplicationController
  before_action :set_target, except: [:pending_requests]

  def send_request
    current_user.friend_request(@target)
    redirect_to profile_path(@target)
  end

  def pending_requests
    @p_requests = current_user.requested_friends.select do |person|
      !person.profile.nil?
    end
  end

  def accept_request
    current_user.accept_request(@target)
    redirect_to profile_path(@target)
  end

  def decline_request
    current_user.decline_request(@target)
    redirect_to profile_path(@target)
  end

  def unfriend
    current_user.remove_friend(@target)
    redirect_to profile_path(@target)
  end

  private

  def set_target
    @target = User.find(params[:id])
    authorize @target, :other?
  end
end
