class EncounterParticipant < ApplicationRecord
  belongs_to :encounter
  belongs_to :character

  validates :character_id, uniqueness: { scope: :encounter_id }
end
