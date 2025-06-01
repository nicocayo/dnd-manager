# app/models/campaign.rb
class Campaign < ApplicationRecord
  has_many :worlds
  has_many :sessions, dependent: :destroy
  has_many :player_characters, class_name: "Character"
  has_many :campaign_notes, -> { where(coming_from: "Campaign") },
           class_name: "Note", foreign_key: "origin_id", dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 2000 }
end
