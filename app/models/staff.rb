class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  has_many :students
  belongs_to :department
  belongs_to :classroom
  has_one_attached :photo
  rolify

  validates :designation, presence: true
  validates :title, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :photo, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :department, presence: true
  validates :phone, presence: true
  validates :dateofbirth, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :salary, presence: true
  validates :lga, presence: true
  validates :hire_date, presence: true
  validates :photo, presence: true
  validates :teacher, inclusion: { in: [true, false] } 

  def fullname
    "#{firstname} #{lastname}"
  end
end
