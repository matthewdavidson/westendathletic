class Admin::PlayersController < ApplicationController

  before_filter :authorisation_required

  # GET /admin/players/1
  def show
    @player = Player.find(params[:id])
  end

  # GET /admin/players/new
  def new
    @player = Team.find(params[:team_id]).players.new
  end

  # GET /admin/players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /admin/players
  def create
    @player = Player.new(params[:player])

    if @player.save
      flash[:success] = 'Player was successfully created.'
      redirect_to admin_team_path(@player.team)
    else
      flash.now[:error] = 'Player creation was unsuccessful.'
      render :new
    end
  end

  # PUT /admin/players/1
  def update
    @player = Player.find(params[:id])

    if @player.update_attributes(params[:player])
      flash[:success] = 'Player was successfully updated.'
      redirect_to admin_team_path(@player.team)
    else
      flash.now[:error] = 'Player edit was unsuccessful.'
      render :edit
    end
  end

  # DELETE /admin/players/1
  def destroy
    @player = Player.find(params[:id])
    team = @player.team
    @player.destroy

    flash[:notice] = 'Player was successfully destroyed.'
    redirect_to admin_team_path(team)
  end

end