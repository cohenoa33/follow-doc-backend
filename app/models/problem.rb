class Problem < ApplicationRecord
  belongs_to :dependent
  has_many :comments, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments, dependent: :destroy

  has_many_attached :files


  validates :name, uniqueness: { scope: :dependent,
  message: "User can not have dependencies with the same name" },  presence: true,  length: { minimum: 2 }


  validates :description, presence: true,  length: { minimum: 3, maximum: 300 }
  validates :dependent_id, presence: true

end



