class Dependent < ApplicationRecord
  belongs_to :user
  has_many :problems , dependent: :destroy
  has_many :comments, through: :problems, dependent: :destroy

  validates :name, presence: true,  length: { minimum: 2 }


end
