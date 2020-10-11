class Dependent < ApplicationRecord
  belongs_to :user
  has_many :problems , dependent: :destroy
  has_many :comments, through: :problems, dependent: :destroy
  has_many :appointments, through: :problems, dependent: :destroy
  has_many :doctors, through: :appointments, dependent: :destroy

  validates :name, presence: true,  length: { minimum: 2 }


end
