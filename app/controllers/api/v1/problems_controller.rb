class Api::V1::ProblemsController < ApplicationController
  def index
    @problems = Problem.all
    render json: @problems
      end

  def show
    @problem = Problem.find_by(id: params[:id])
    if @problem
      render json: @problem
    else
      render json: { message: 'This ID does not exist' }
    end
  end
end
