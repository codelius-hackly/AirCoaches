class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coaching_offers
  has_many :bookings
  # has_many :bookings, through: :coaching_offers

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :profile_pic
end
