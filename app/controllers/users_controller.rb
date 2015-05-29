class UsersController < SessionsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
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