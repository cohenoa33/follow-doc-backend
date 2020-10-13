class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :street, :city, :zipcode, :state, :info, :latitude, :longitude, :address
end
