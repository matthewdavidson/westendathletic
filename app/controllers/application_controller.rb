class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :get_current_user

  protected

  def get_current_user
  	return unless session[:user_id]
  	@current_user = User.find_by_id(session[:user_id])
  end

  def authorisation_required
  	return unless @current_user.nil?
  	redirect_to new_admin_session_path, notice: 'You must be logged in to view this page.'
  end

end