module ApplicationHelper
  def username
    if @user == current_user
      "#{@user.profile.name} - It's you !"
    else
      @user.profile.name
    end
  end

  def manage_profile_path
    if current_user.profile.nil?
      new_profile_path(current_user)
    else
      edit_profile_path(current_user)
    end
  end
end
