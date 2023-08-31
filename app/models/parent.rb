class Parent < ApplicationRecord
    has_many :students, dependent: :destroy
end
