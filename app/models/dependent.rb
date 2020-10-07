class Dependent < ApplicationRecord
  belongs_to :user
  has_many :problems
  has_many :comments, through: :problems, dependent: :destroy
end
