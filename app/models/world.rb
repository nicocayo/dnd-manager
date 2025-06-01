class World < ApplicationRecord
  belongs_to :campaign
  has_many :locations, dependent: :destroy
  has_many :world_notes, -> { where(coming_from: "World") },
           class_name: "Note", foreign_key: "origin_id", dependent: :destroy

  has_many_attached :maps # For multiple map files/images

  validates :name, presence: true
  validates :campaign_id, presence: true
end
