class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :authenticate_staff!

  def application_view
    # Add any logic or instance variables you need here
    render 'layouts/application' # Assuming 'layouts/application.html.erb' is your layout file
  end
end
