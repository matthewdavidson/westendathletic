class Admin::PlayersController < ApplicationController
  
  before_filter :authorisation_required
  
  # GET /admin/team/1/players/1
  def show
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:id])
  end

  # GET /admin/team/1/players/new
  def new
    @team = Team.find(params[:team_id])
    @player = @team.players.new
  end

  # GET /admin/team/1/players/1/edit
  def edit
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:id])
  end

  # POST /admin/team/1/players
  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.new(params[:player])

    if @player.save
      flash[:success] = 'Player was successfully created.'
      redirect_to admin_team_path(@team)
    else
      flash.now[:error] = 'Player creation was unsuccessful.'
      render :new
    end
  end

  # PUT /admin/team/1/players/1
  def update
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:id])
    
    if @player.update_attributes(params[:player])
      flash[:success] = 'Player was successfully updated.'
      redirect_to admin_team_path(@team)
    else
      flash.now[:error] = 'Player edit was unsuccessful.'
      render :edit
    end
  end

  # DELETE /admin/team/1/players/1
  def destroy
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:id])
    @player.destroy

    flash[:success] = 'Player was successfully destroyed.'
    redirect_to admin_team_path(@team)
  end

end