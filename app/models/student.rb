class Student < ApplicationRecord
    belongs_to :parent
    belongs_to :classroom
    has_many :tests, dependent: :destroy
    has_many :exams, dependent: :destroy
end
