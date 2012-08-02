class Admin::DashboardController < ApplicationController

	before_filter :authorisation_required

  # GET /admin
  # GET /admin/dashboard
  def index
  end

end
