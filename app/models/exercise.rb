class Exercise < ApplicationRecord
  has_many :rounds
  belongs_to :conversation

  validates :name, presence: true
  validates :description, presence: true
end
