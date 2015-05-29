class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_session(session[:session_token]) if session[:session_token]
  end
end
