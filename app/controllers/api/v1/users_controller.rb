class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    else
      render json: { message: 'This ID does not exist' }
    end
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      render json: @user
    else
      render json: { error: 'Wrong username or password' }
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)

      render json: @user
    else
      render json: { error: 'Something went wrong' }
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy

    render json: { message: 'User deleted' }
  end

  def persist
    token = encode_token({ user_id: @user.id })
    render json: { user: UserSerializer.new(@user), jwt: token }
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
