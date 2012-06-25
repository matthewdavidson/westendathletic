class Admin::SessionsController < ApplicationController

  # GET /session/new
  def new
    @session = Session.new
  end

  # POST /session
  def create
    @session = Session.new(params[:session])

    if @session.valid?
      session[:user_id] = @session.user.id
      redirect_to admin_root_path
    else
      flash.now[:error] = 'Your login attempt was unsuccessful.'
      render "new"
    end
  end

  # DELETE /session
  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out.'
    redirect_to new_admin_session_path
  end
end