class ProfilesController < ApplicationController
  before_action :require_authentication, only: %i[ new create edit update ]
  before_action :resume_session, only: %i[ show ]

  def new
    @profile = Profile.new
    @user = Current.user
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = Current.user

    if @profile.save
      redirect_to profile_path(@profile.username), notice: "Profile created successfully."
    else
      @user = Current.user
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
      @profile = Profile.find_by(username: params[:username])
      @user = Current.user
      # @payment_links = @profile.paymentlinks.includes(:payment_platform)
      @payment_links = @profile.payment_links
      if !@profile
        raise ActiveRecord::RecordNotFound, "Not Found"
      end
  end

  def edit
    @profile = Current.user.profile
  end

  def update
    @profile = Current.user.profile
    if @profile.update(profile_params)
      redirect_to profile_path(@profile.username), notice: "Profile updated successfully."
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:bio, :username, :nickname)
  end
end
