class SessionsController < ApplicationController

  # GET /session/new
  def new
    @session = Session.new
  end

  # POST /session
  def create
    @session = Session.new(params[:session])

    if @session.valid?
      session[:user_id] = @session.user.id
      redirect_to @session.user
    else
      render "new"
    end
  end

  # DELETE /session
  def destroy
    session['user_id'] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end