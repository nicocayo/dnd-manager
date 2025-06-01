class Session < ApplicationRecord
  belongs_to :campaign
  has_many :encounters, dependent: :destroy
  has_many :session_notes, -> { where(coming_from: "Session") },
           class_name: "Note", foreign_key: "origin_id", dependent: :destroy

  validates :date, presence: true
  validates :title, presence: true

  scope :recent, -> { order(date: :desc) }
  scope :by_campaign, ->(campaign) { where(campaign: campaign) }
end
