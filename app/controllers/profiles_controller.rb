class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @profile = current_user.build_profile
    @countries = ISO3166::Country.all_translated
    @companies = companies
  end

  def edit
    @profile = current_user.profile
    @countries = ISO3166::Country.all_translated
    @companies = companies
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      redirect_to profile_path(current_user)
    else
      render :edit
    end
  end

  private

  def companies
    ['Startup',
     'Conglomerate',
     'Medium Company (10 - 50 employees)',
     'Small Company (1 - 9 employees)',
     'Freelancer',
     'Middle School',
     'High School',
     'University',
     'Collage',
     'Graduate School']
  end

  def profile_params
    params.require(:profile).permit(:avatar,
                                    :status,
                                    :sex,
                                    :name,
                                    :skype,
                                    :twitter,
                                    :github,
                                    :livecodingtv,
                                    :born_country)
  end
end
