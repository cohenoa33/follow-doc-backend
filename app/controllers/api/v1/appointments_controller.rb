class Api::V1::AppointmentsController < ApplicationController
    def index
        @appointments = Appointment.all
        render json: @appointments
          end
    
      def show
        @appointment = Appointment.find_by(id: params[:id])
        if @appointment
          render json: @appointment
        else
          render json: { message: 'This ID does not exist' }
        end
      end
    
      def create
        @appointment = Appointment.create(appointment_params)
        if @appointment.valid?
          render json: @appointment
    
        else
          render json: { error: 'failed to add new appointment' }, status: :not_acceptable
        end
      end
      def update
        @appointment = Appointment.find_by(id: params[:id])
        if @appointment.update(appointment_params)
          render json: @appointment
        else
          render json: { error: 'Something went wrong' }
        end
      end
    
      def destroy
        @appointment = Appointment.find_by(id: params[:id])
        @appointment.destroy
    
        render json: { message: 'deleted' }
      end
    
    
      private
    
      def appointment_params
        params.require(:appointment).permit(:date,:time, :note, :doctor_id, :problem_id, :insurance_auth, :status_open)
      end
    end
    
