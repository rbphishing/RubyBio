class ApplicationController < ActionController::Base
  helper_method :current_user
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to "/login", alert: "You must be logged in to access this page"
    end
  end
  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
