class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :problem
  has_one :dependent, through: :problem, dependent: :destroy


  validates :problem_id, presence: true
  validates :doctor_id, presence: true
  validates :date, presence: true
  validates :time, presence: true
  
end
