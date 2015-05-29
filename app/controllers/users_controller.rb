class UsersController < SessionsController
  skip_before_filter :authorize, :only => :create

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user.name = params[:name]
    # @user.password = params[:password]
    # @user.password_confirmation = params[:password_confirmation]
    # @user.phone = params[:phone]
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


  def user_params
    params.permit(:phone, :password, :password_confirmation, :name)
  end

end