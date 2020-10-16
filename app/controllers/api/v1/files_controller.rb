class Api::V1::FilesController < ApplicationController

    def create
 problem = Problem.find(params[:problem_id])
 file = problem.files.attach(params[:file])

 render json: {path: rails_blob_path(problem.files.last, only_path: true)}
    end
end
