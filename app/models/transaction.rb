class Transaction < ApplicationRecord
  validates_presence_of :customer_email
  validate :movie_available?
  after_save :update_stock

  scope :created_between, lambda { |from, to|
                            where('created_at >= ? AND created_at <= ?', from.to_time, to.to_time.end_of_day) # both dates inclusive
                          }

  belongs_to :movie

  def update_stock
    movie.update({ stock: movie.stock - 1 }) if movie.available
  end

  def movie_available?
    errors.add(:transaction, 'Movie not available') unless movie.available
  end
end
