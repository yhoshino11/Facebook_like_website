class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @country = @user.country
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
      languages = params[:profile][:language][:name].select { |item| item.present? }
      languages.each do |lang|
        @profile.languages.create(name: lang)
      end
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      languages = params[:profile][:language][:name].select { |item| item.present? }
      @profile.languages.destroy_all if @profile.languages.exists?
      languages.each do |lang|
        @profile.languages.create(name: lang)
      end
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
    params.require(:profile)
      .permit(:avatar, :status,
              :sex, :name,
              :skype, :twitter,
              :github, :livecodingtv,
              :born_country,
              languages_attributes: [:name])
  end
end
