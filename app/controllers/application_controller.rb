class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :get_current_user

  protected

  def get_current_user
  	User.find_by_id(session[:user_id]) do |user|
      if user.nil?
        @current_user = session[:user_id] = nil
      else
        @current_user = user
      end
    end
  end

  def authorisation_required
  	if @current_user.nil?
  	 redirect_to new_admin_session_path, notice: 'You must be logged in to view this page.'
    end
  end

end