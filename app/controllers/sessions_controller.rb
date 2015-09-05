class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    if resource.profile.nil?
      resource.create_profile!(born_country: resource.country)
    end
    profile_path(resource)
  end
end
