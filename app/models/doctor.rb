class Doctor < ApplicationRecord
  
    geocoded_by :address
    after_validation :geocode

    def address
        [street, city, state, zipcode].compact.join(', ')
      end


      validates :name, uniqueness: { case_sensitive: false }, presence: true
end
