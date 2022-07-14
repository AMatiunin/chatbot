class Round < ApplicationRecord
  belongs_to :exercise

  validates :name, presence: true
end
