class Api::V1::DependentsController < ApplicationController
  def index
    @dependents = Dependent.all
    render json: @dependents
    end

  def show
    @dependent = Dependent.find_by(id: params[:id])
    if @dependent
      render json: @dependent
    else
      render json: { message: 'This ID does not exist' }
    end
  end

  def create
    @dependent = Dependent.create(dependent_params)
  
    if @dependent.valid?
      render json: @dependent

    else
      render json: { error: @dependent.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    @dependent = Dependent.find_by(id: params[:id])
    if @dependent.update(dependent_params)
      render json: @dependent
    else
      render json: { error:  @dependent.errors.full_messages }
    end
  end
  private

  def dependent_params
    params.require(:dependent).permit(:name, :user_id)
  end
end
