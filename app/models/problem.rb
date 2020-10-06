class Problem < ApplicationRecord
  belongs_to :dependent
  has_many :comments, dependent: :destroy
end
