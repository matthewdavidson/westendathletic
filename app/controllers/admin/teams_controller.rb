class Admin::TeamsController < ApplicationController

	before_filter :authorisation_required
  
  # GET /admin/teams
  def index
    @teams = Team.all
  end

  # GET /admin/teams/1
  def show
    @team = Team.find(params[:id])
  end

  # GET /admin/teams/new
  def new
    @team = Team.new
  end

  # GET /admin/teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /admin/teams
  def create
    @team = Team.new(params[:team])

    if @team.save
      flash[:success] = 'Team was successfully created.'
      redirect_to admin_teams_path
    else
      flash.now[:error] = 'Team creation was unsuccessful.'
      render :new
    end
  end

  # PUT /admin/teams/1
  def update
    @team = Team.find(params[:id])
    
    if @team.update_attributes(params[:team])
      flash[:success] = 'Team was successfully updated.'
      redirect_to admin_teams_path 
    else
      flash.now[:error] = 'Team edit was unsuccessful.'
      render :edit
    end
  end

  # DELETE /admin/teams/1
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    flash[:success] = 'Team was successfully destroyed.'
    redirect_to admin_teams_path
  end

end