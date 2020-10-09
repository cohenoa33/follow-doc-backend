class Problem < ApplicationRecord
  belongs_to :dependent
  has_many :comments, dependent: :destroy

  validates :name, presence: true,  length: { minimum: 2 }
  validates :description, presence: true,  length: { minimum: 3 }
  validates :dependent_id, presence: true

end
