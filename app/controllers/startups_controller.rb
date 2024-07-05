class StartupsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :authenticate_user!, only: [:favorites, :favorite, :unfavorite]
  before_action :set_startup, only: %i[show edit update destroy favorite unfavorite]
  before_action :set_startups, only: %i[index show edit]

  def index
    @startups = filter_startups(params[:filter]).order(:name)
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
    favorite_status = params[:startup].delete(:favorite)
    @startup.logo_url = 'no_logo.png' if params[:startup][:logo_url].blank?

    respond_to do |format|
      if @startup.update(startup_params)
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

  def set_startups
    @startups = Startup.all
  end

  def startup_params
    params.require(:startup).permit(:name, :homepage_url, :logo_url, :industry, :description, :hq_location, :total_funding, :comments, :funding_date, :last_funding, :round_name)
  end

  def filter_startups(filter)
    case filter
    when "YTD"
      year_start = Date.current.beginning_of_year
      Startup.where(funding_date: year_start..Time.current)
    when "Current Month"
      month_start = Date.current.beginning_of_month
      Startup.where(funding_date: month_start..Time.current)
    when "Current Quarter"
      quarter_start = Date.current.beginning_of_quarter
      Startup.where(funding_date: quarter_start..Time.current)
    when "Previous Quarter"
      quarter_start = (Date.current - 3.months).beginning_of_quarter
      quarter_end = quarter_start.end_of_quarter
      Startup.where(funding_date: quarter_start..quarter_end)
    when "Last 12 Months"
      one_year_ago = Date.current - 1.year
      Startup.where(funding_date: one_year_ago..Time.current)
    when "Previous Year"
      last_year = Date.current.last_year
      year_start = last_year.beginning_of_year
      year_end = last_year.end_of_year
      Startup.where(funding_date: year_start..year_end)
    else
      Startup.all
    end
  end
end
