class Exercise < ApplicationRecord
  belongs_to :conversation
  has_many :rounds
end
