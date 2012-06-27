class Admin::CompetitionsController < ApplicationController

	before_filter :authorisation_required
  
  # GET /admin/competitions
  def index
    @competitions = Competition.all
  end

  # GET /admin/competitions/1
  def show
    @competition = Competition.find(params[:id])
  end

  # GET /admin/competitions/new
  def new
    @competition = Competition.new
  end

  # GET /admin/competitions/1/edit
  def edit
    @competition = Competition.find(params[:id])
  end

  # POST /admin/competitions
  def create
    @competition = Competition.new(params[:competition])

    if @competition.save
      flash[:success] = 'Competition was successfully created.'
      redirect_to admin_competitions_path
    else
      flash.now[:error] = 'Competition creation was unsuccessful.'
      render :new
    end
  end

  # PUT /admin/competitions/1
  def update
    @competition = Competition.find(params[:id])
    
    if @competition.update_attributes(params[:competition])
      flash[:success] = 'Competition was successfully updated.'
      redirect_to admin_competitions_path 
    else
      flash.now[:error] = 'Competition edit was unsuccessful.'
      render :edit
    end
  end

  # DELETE /admin/competitions/1
  def destroy
    @competition = Competition.find(params[:id])
    @competition.destroy

    flash[:success] = 'Competition was successfully destroyed.'
    redirect_to admin_competitions_path
  end

end