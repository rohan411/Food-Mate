class SessionsController < ApplicationController

  before_filter :authorize, :except => [:create]
  
  def authorize
    session_token = params[:session_token] || session[:session_token]
    if session_token && User.find_by_session_token(params[:session_token])
      api_response(nil, "You are not logged in", 401)
    else
      api_response(nil, "Missing sesion token", 400)
    end
  end

  def new
  end

  def create
    user = User.authenticate(params[:phone], params[:password])
    if user
      session_token = user.id.to_s + SecureRandom.base64(64).gsub(/[$=+\/]/,65.+(rand(25)).chr)
      user.session_token = session_token
      session[:session_token] = session_token
      user.save
      api_response(nil, 'Logged in!!!', 200)
    else
      api_response(nil, "Invalid phone or password", 400)
    end
  end

  def destroy
    session[:session_token] = nil
    user.update_attributes(:session_token => nil)
    api_response(nil, 'Logged out!!!', 200)
  end

  private 

  def api_response(payload, message, status)
      render :json => {
            :payload => payload,
            :message => message
        },:status => status
  end
end