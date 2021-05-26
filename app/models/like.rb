class Like < ApplicationRecord
  validates_presence_of :customer_email
  validates :customer_email, uniqueness: { scope: [:movie_id] } # customers wont be able to like a movie more than once

  belongs_to :movie
end
