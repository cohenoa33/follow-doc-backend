class Api::V1::DoctorsController < ApplicationController
    def index
        @doctors = Doctor.all
        render json: @doctors
          end
    
      def show
        @doctor = Doctor.find_by(id: params[:id])
        if @doctor
          render json: @doctor
        else
          render json: { message: 'This ID does not exist' }
        end
      end
    
      def create
        @doctor = Doctor.create(doctor_params)
        if @doctor.valid?
          render json: @doctor
    
        else
          render json: { error: 'failed to add new doctor' }, status: :not_acceptable
        end
      end
      def update
        @doctor = Doctor.find_by(id: params[:id])
        if @doctor.update(doctor_params)
          render json: @doctor
        else
          render json: { error: 'Something went wrong' }
        end
      end
    
      def destroy
        @doctor = Doctor.find_by(id: params[:id])
        @doctor.destroy
    
        render json: { message: 'deleted' }
      end
    
    
      private
    
      def doctor_params
        params.require(:doctor).permit(:name,:street,:city,:state, :zipcode, :info)
    end
    
end

