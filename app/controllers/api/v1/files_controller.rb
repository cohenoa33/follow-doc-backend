class Api::V1::FilesController < ApplicationController

def create
    problem = Problem.find(params[:problem_id])
    file = problem.files.attach(params[:file])

    render json: problem
#  render json: {path: rails_blob_path(problem.files.last, only_path: true)}
    end

    def destroy
        problem = Problem.find(params[:problem_id])
        problem.files[params[:file]].purge
        # return the update problem without the deleted file
        data = Problem.find(params[:problem_id])
        render json: data
    end
   

end
