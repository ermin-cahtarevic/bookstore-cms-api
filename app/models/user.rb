class User < ApplicationRecord
  has_secure_password

  has_many :books, dependent: :delete_all

  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: true
end
