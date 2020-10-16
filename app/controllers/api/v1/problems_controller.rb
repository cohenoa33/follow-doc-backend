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
  def update
    @problem = Problem.find_by(id: params[:id])
    if @problem.update(problem_params)
      render json: @problem
    else
      render json: { error: 'Something went wrong' }
    end
  end

  def destroy
    @problem = Problem.find_by(id: params[:id])
    @problem.destroy

    render json: { message: 'deleted' }
  end


  private

  def problem_params
    params.require(:problem).permit(:name, :dependent_id, :description, files:[])
  end
end
