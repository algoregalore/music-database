# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_artists_on_genre_id  (genre_id)
#

class Artist < ApplicationRecord
  belongs_to :genre
  has_many :songs

  # validations
    # name
      # present
      # unique
  validates :name, presence: true, uniqueness: true

      # genre id
      # present
  validates :genre_id, presence: true

    # genre actually exists
  validates :genre, presence: true

  scope :recent, -> (minutes_past=60) {where("created_at > ?", minutes_past.minutes_ago)}

  scope :today, -> { where('DATE(created_at) = ?', Date.today)}


end
