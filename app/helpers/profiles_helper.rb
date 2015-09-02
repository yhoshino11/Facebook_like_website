module ProfilesHelper
  def username
    if current_user == @user
      "#{@user.profile.name} - It's You !"
    else
      @user.profile.name
    end
  end
end
