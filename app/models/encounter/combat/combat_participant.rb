class CombatParticipant < ApplicationRecord
  belongs_to :combat
  belongs_to :character
  has_many :combat_participant_conditions, dependent: :destroy
  has_many :conditions, through: :combat_participant_conditions

  validates :character_id, uniqueness: { scope: :combat_id }
  validates :initiative, presence: true, numericality: true

  def apply_condition(condition)
    combat_participant_conditions.create(condition: condition)
  end
end
