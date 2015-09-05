class HomeController < ApplicationController
  def index
    @users = User.all.select do |user|
      !user.profile.nil?
    end
  end
end
