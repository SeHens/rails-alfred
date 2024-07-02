# app/controllers/startups_controller.rb
class StartupsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :authenticate_user!, only: [:favorites, :favorite, :unfavorite]
  before_action :set_startup, only: %i[show edit update destroy favorite unfavorite]

  def index
    @startups = Startup.all
    @favorites = current_user.favorites.includes(:startup) if user_signed_in?
  end

  def favorites
    if user_signed_in?
      @startups = current_user.favorites.includes(:startup).map(&:startup)
      @favorites = current_user.favorites.includes(:startup)
    else
      @startups = []
    end
  end

  def show; end

  def new
    @startup = Startup.new
  end

  def edit; end

  def create
    @startup = Startup.new(startup_params)
    @startup.logo_url = 'no_logo.png' if @startup.logo_url.blank?

    respond_to do |format|
      if @startup.save
        format.html { redirect_to startups_path, notice: "Startup was successfully created." }
        format.json { render :show, status: :created, location: @startup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # Update the favorite status based on the form submission
    favorite_status = params[:startup].delete(:favorite)

    # Set the logo URL to 'no_logo.png' if it's blank
    @startup.logo_url = 'no_logo.png' if params[:startup][:logo_url].blank?

    respond_to do |format|
      if @startup.update(startup_params)
        # Update the favorite status if it was provided in the form
        if favorite_status.present?
          @startup.update(favorite: ActiveRecord::Type::Boolean.new.cast(favorite_status))
        end

        format.html { redirect_to startups_path, notice: "Startup was successfully updated." }
        format.json { render :show, status: :ok, location: @startup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @startup.destroy!

    respond_to do |format|
      format.html { redirect_to startups_url, notice: "Startup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def favorite
    favorite = current_user.favorites.new(startup: @startup)

    respond_to do |format|
      if favorite.save
        format.json { render json: { status: 'favorited', count: current_user.favorites.count } }
      else
        format.json { render json: { status: 'error' }, status: :unprocessable_entity }
      end
    end
  end

  def unfavorite
    favorite = current_user.favorites.find_by(startup: @startup)

    respond_to do |format|
      if favorite&.destroy
        format.json { render json: { status: 'unfavorited', count: current_user.favorites.count } }
      else
        format.json { render json: { status: 'error' }, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_startup
      @startup = Startup.find(params[:id])
    end

    def startup_params
      params.require(:startup).permit(:name, :homepage_url, :logo_url, :industry, :description, :hq_location, :total_funding)
    end
end
