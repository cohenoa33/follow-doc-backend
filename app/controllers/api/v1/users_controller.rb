class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), token: token }
    else
      render json: { error: 'wrong user or password' }
    end
end

  def persist
    token = encode_token({ user_id: @user.id })
    render json: { user: UserSerializer.new(@user), token: token }
  end

    private

  def user_params
    params.require(:user).permit(:username, :password, :email, :password_confirmation)
  end
  end
