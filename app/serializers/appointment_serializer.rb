class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :note, :insurance_auth, :status_open
  has_one :doctor
  has_one :problem
  has_one :dependent 
end
