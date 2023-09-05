class Staff < ApplicationRecord
  has_many :students
  belongs_to :department
  has_one_attached :photo


  validates :designation, presence: true
  validates :title, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :photo, presence: true
  validates :department, presence: true
  validates :phone, presence: true
  validates :dateofbirth, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :salary, presence: true
  validates :lga, presence: true
  validates :hire_date, presence: true
end
