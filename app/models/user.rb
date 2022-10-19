class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  validates :admin, presence: true

  has_secure_password

  before_validation { email.downcase! }
end
