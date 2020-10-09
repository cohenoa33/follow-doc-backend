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

  def create
    @problem = Problem.create(problem_params)
    if @problem.valid?
      render json: @problem

    else
      render json: { error: 'failed to add new problem' }, status: :not_acceptable
    end
  end

  private

  def problem_params
    params.require(:problem).permit(:name, :dependent_id, :description)
  end
end
