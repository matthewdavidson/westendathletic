class Admin::SeasonsController < ApplicationController

  before_filter :authorisation_required

  # GET /admin/seasons/1
  def show
    @season = Season.find(params[:id])
  end

  # GET /admin/seasons/new
  def new
    @season = Competition.find(params[:competition_id]).seasons.new
  end

  # GET /admin/seasons/1/edit
  def edit
    @season = Season.find(params[:id])
  end

  # POST /admin/seasons
  def create
    @season = Season.new(params[:season])

    if @season.save
      flash[:success] = 'Season was successfully created.'
      redirect_to admin_competition_path(@season.competition)
    else
      flash.now[:error] = 'Season creation was unsuccessful.'
      render :new
    end
  end

  # PUT /admin/seasons/1
  def update
    @season = Season.find(params[:id])

    if @season.update_attributes(params[:season])
      flash[:success] = 'Season was successfully updated.'
      redirect_to admin_competition_path(@season.competition)
    else
      flash.now[:error] = 'Season edit was unsuccessful.'
      render :edit
    end
  end

  # DELETE /admin/seasons/1
  def destroy
    @season = Season.find(params[:id])
    competition = @season.competition
    @season.destroy

    flash[:notice] = 'Season was successfully destroyed.'
    redirect_to admin_competition_path(competition)
  end

  # GET /admin/seasons/1/teams
  def teams
    @season = Season.find(params[:id])
  end

  # PUT /admin/seasons/1/teams
  def update_teams
    @season = Season.find(params[:id])
    @season.teams = Team.find_all_by_id(params[:teams].values.to_a)

    if @season.save
      flash[:success] = 'Teams successfully updated for this season.'
      redirect_to admin_season_path(@season)
    else
      flash.now[:error] = 'Teams edit for this season was unsuccessful.'
      render :teams
    end
  end

end