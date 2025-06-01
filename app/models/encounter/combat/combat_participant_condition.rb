class CombatParticipantCondition < ApplicationRecord
  belongs_to :combat_participant
  belongs_to :condition

  validates :condition_id, uniqueness: { scope: :combat_participant_id }
end
