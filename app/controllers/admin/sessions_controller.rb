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
      if session[:redirect]
        redirect_to session[:redirect] and session[:redirect] = nil
      else
        redirect_to admin_root_path
      end
    else
      flash.now[:error] = 'Your login attempt was unsuccessful.'
      render "new"
    end
  end

  # DELETE /session
  def destroy
    session[:user_id] = nil
    flash[:info] = 'You have successfully logged out.'
    redirect_to root_path
  end
end