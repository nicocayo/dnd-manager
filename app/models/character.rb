class Character < ApplicationRecord
  belongs_to :campaign
  has_many :character_notes, -> { where(coming_from: "Character") },
           class_name: "Note", foreign_key: "origin_id", dependent: :destroy
  has_many :combat_participants, dependent: :destroy
  has_many :combats, through: :combat_participants
  has_many :encounter_participants, dependent: :destroy
  has_many :encounters, through: :encounter_participants

  has_one_attached :character_sheet # PDF or image file

  enum character_type: { player: 0, npc: 1, enemy: 2 }
  enum status: { alive: 0, dead: 1, missing: 2 }

  validates :name, presence: true
  validates :character_type, presence: true

  # Store flexible stats as JSON
  store_accessor :stats, :strength, :dexterity, :constitution,
                        :intelligence, :wisdom, :charisma, :armor_class,
                        :hit_points, :speed, :proficiency_bonus, :skills
end
