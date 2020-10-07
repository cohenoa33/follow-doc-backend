class User < ApplicationRecord
  has_many :dependents
  has_many :problems, through: :dependents, dependent: :destroy
  has_many :comments, through: :problems, dependent: :destroy

  validates :email, uniqueness: { case_sensitive: false }, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :username, uniqueness: { case_sensitive: false }, presence: true

  has_secure_password
end
