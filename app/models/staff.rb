class Staff < ApplicationRecord
  has_many :students
  belongs_to :department
  has_one_attached :photo


  validates :designation, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :photo, presence: true
  validates :phone, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :salary, presence: true
  validates :lga, presence: true
end
