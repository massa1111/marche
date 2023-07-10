class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments
  has_many :items
  has_many :orders
  has_one_attached :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :profile_image, presence: true
end
