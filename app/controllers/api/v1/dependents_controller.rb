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
end
