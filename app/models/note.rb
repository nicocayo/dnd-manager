class Note < ApplicationRecord
  validates :title, presence: true
  validates :coming_from, presence: true
  validates :origin_id, presence: true

  enum coming_from: [ :session, :character, :encounter, :world, :campaign ]

  def origin
    coming_from.constantize.find(origin_id)
  end
end
