class Location < ApplicationRecord
  belongs_to :world
  belongs_to :parent_location, class_name: "Location", optional: true
  has_many :child_locations, class_name: "Location",
           foreign_key: "parent_location_id", dependent: :destroy
  has_many :notable_npcs, -> { where(character_type: "npc") },
           class_name: "Character", foreign_key: "current_location_id"

  enum location_type: { city: 0, dungeon: 1, wilderness: 2, building: 3, room: 4 }

  validates :name, presence: true
  validates :location_type, presence: true

  # Prevent circular references
  validate :cannot_be_parent_of_itself

  private

  def cannot_be_parent_of_itself
    errors.add(:parent_location, "cannot be itself") if parent_location == self
  end
end
