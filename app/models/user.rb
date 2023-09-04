class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :staffs, dependent: :destroy
  has_many :students, dependent: :destroy
  has_one_attached :photo


  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :photo, presence: true
  validates :phone, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :lga, presence: true
end
