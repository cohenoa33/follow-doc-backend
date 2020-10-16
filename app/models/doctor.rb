class Doctor < ApplicationRecord

    geocoded_by :address
    after_validation :geocode

    def address
        [street, city, state, zipcode].compact.join(', ')
      end

      validates :name, presence: true
end
