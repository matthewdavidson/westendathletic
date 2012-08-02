class Admin::UsersController < ApplicationController

  before_filter :authorisation_required

  # GET /admin/users
  def index
    @users = User.all
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # GET /admin/users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /admin/users
  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = 'User was successfully created.'
      redirect_to admin_users_path
    else
      flash.now[:error] = 'User creation was unsuccessful.'
      render :new
    end
  end

  # PUT /admin/users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:success] = 'User was successfully updated.'
      redirect_to admin_users_path
    else
      flash.now[:error] = 'User edit was unsuccessful.'
      render :edit
    end
  end

  # DELETE /admin/users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:notice] = 'User was successfully destroyed.'
    redirect_to admin_users_path
  end

end