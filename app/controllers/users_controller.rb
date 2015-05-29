class UsersController < SessionsController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.phone = params[:phone],
    @user.password = params[:password],
    @user.password_confirmation = params[:password_confirmation]
    debugger
    if @user.save
      api_response(@user.id, 'Sign up successful', 200)
    else
      api_response(@user.errors, 'Sign up unsuccessful', 400)
    end
  end

  private 

  def api_response (payload, message, status)
      render :json => {
            :payload => payload,
            :message => message
        },:status => status
  end

end