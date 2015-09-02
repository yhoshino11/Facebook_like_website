class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    resource.create_profile!(born_country: resource.country)
    profile_path(resource)
  end
end
