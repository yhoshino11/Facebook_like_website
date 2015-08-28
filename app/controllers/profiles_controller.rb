class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @profile = current_user.build_profile
  end

  def edit
    @profile = current_user.profile
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

  def profile_params
    params.require(:profile).permit(:avatar,
                                    :name,
                                    :twitter,
                                    :github,
                                    :livecodingtv)
  end
end
