module ProfilesHelper
  def username
    if current_user == @user
      "#{@user.profile.name} - It's You !"
    else
      @user.profile.name
    end
  end

  def country
    return unless @user.profile.born_country.present?
    content_tag(:h3, "I'm from #{@user.profile.born_country}")
  end

  def status
    return unless @user.profile.status.present?
    content_tag(:h3, "Status: #{@user.profile.status}")
  end

  def pending_friends
    req_count = current_user.requested_friends.count
    return unless req_count > 0
    content_tag(:p,
                link_to(
                  "Pending Friend Request #{req_count}",
                  pending_requests_user_path(current_user),
                  class: 'btn btn-danger'))
  end
end
