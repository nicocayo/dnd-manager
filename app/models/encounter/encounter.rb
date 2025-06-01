class Encounter < ApplicationRecord
  belongs_to :session, optional: true # Can exist without session for planning
  has_many :encounter_notes, -> { where(coming_from: "Encounter") },
           class_name: "Note", foreign_key: "origin_id", dependent: :destroy
  has_many :encounter_participants, dependent: :destroy
  has_many :characters, through: :encounter_participants
  has_one :combat, dependent: :destroy

  enum encounter_type: { combat: 0, exploration: 1, social: 2, puzzle: 3 }
  enum status: { prepared: 0, ready: 1, finished: 2 }

  validates :encounter_type, presence: true
end
