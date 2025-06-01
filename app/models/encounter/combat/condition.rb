class Condition < ApplicationRecord
  has_many :combat_participant_conditions
  has_many :combat_participants, through: :combat_participant_conditions

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
