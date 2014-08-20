class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, uniqueness: true
end
