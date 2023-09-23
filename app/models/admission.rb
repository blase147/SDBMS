class Admission < ApplicationRecord
    has_many :parents

    validates :first_name, presence: true
    validates :last_name, presence: true
    # ... other model code ...
  end
  