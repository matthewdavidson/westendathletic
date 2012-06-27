class Admin::SeasonsController < ApplicationController

	before_filter :authorisation_required
  
  # GET /admin/competition/1/seasons
  def index
    @competition = Competition.find(params[:competition_id])
    @seasons = @competition.seasons.all
  end

  # GET /admin/competition/1/seasons/1
  def show
    @competition = Competition.find(params[:competition_id])
    @season = @competition.seasons.find(params[:id])
  end

  # GET /admin/competition/1/seasons/new
  def new
    @competition = Competition.find(params[:competition_id])
    @season = @competition.seasons.new
  end

  # GET /admin/competition/1/seasons/1/edit
  def edit
    @competition = Competition.find(params[:competition_id])
    @season = @competition.seasons.find(params[:id])
  end

  # POST /admin/competition/1/seasons
  def create
    @competition = Competition.find(params[:competition_id])
    @season = @competition.seasons.new(params[:season])

    if @season.save
      flash[:success] = 'Season was successfully created.'
      redirect_to admin_competition_path(@competition)
    else
      flash.now[:error] = 'Season creation was unsuccessful.'
      render :new
    end
  end

  # PUT /admin/competition/1/seasons/1
  def update
    @competition = Competition.find(params[:competition_id])
    @season = @competition.seasons.find(params[:id])
    
    if @season.update_attributes(params[:season])
      flash[:success] = 'Season was successfully updated.'
      redirect_to admin_competition_path(@competition)
    else
      flash.now[:error] = 'Season edit was unsuccessful.'
      render :edit
    end
  end

  # DELETE /admin/competition/1/seasons/1
  def destroy
    @competition = Competition.find(params[:competition_id])
    @season = @competition.seasons.find(params[:id])
    @season.destroy

    flash[:success] = 'Season was successfully destroyed.'
    redirect_to admin_competition_path(@competition)
  end

end