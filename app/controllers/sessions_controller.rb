class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    resource.create_profile!(born_country: resource.country) unless resource.profile
    profile_path(resource)
  end
end
