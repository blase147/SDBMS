class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :students
  belongs_to :department
  has_one_attached :photo


  enum role: [:admin, :staff] # Add more roles if needed
  # ... other attributes ...

  # Example: Check if a staff member is an admin
  def admin?
    role == 'admin'
  end
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
end
