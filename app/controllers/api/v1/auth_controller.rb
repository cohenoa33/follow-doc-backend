class Api::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      my_token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: my_token }
    else
      render json: { error: 'That user could not be found' }, status: 401
    end
  end

  private

  def user_login_params
    params.require(:auth).permit(:username, :password)
  end
end
