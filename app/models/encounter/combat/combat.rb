class Combat < ApplicationRecord
  belongs_to :encounter
  has_many :combat_participants, dependent: :destroy
  has_many :characters, through: :combat_participants

  validates :name, presence: true
  validates :encounter, presence: true

  scope :active, -> { where.not(current_round: nil) }
end
