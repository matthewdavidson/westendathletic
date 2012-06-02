
class SessionsController < ApplicationController

  # GET /session/new
  def new
    flash[:error] = nil
  end

  # POST /session
  def create
    user = User.authenticate(
      params[:username], 
      params[:password]
    ) 

    if user
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash[:error] = 'Invalid credentials!'
      render "new"
    end
  end

  # DELETE /session
  def destroy
    session['user_id'] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end
