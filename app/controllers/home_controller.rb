class HomeController < ApplicationController
  def index
    @users = User.all.select do |user|
      user.profile.present?
    end
  end
end
