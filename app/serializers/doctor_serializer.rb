class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :street, :city, :zipcode, :state, :latitude, :longitude, :address
end
