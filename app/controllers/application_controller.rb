class ApplicationController < ActionController::Base
  # before_action :authenticate_staff!

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_url, alert: 'Access denied.'
  end
end
