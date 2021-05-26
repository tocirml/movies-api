class Movie < ApplicationRecord
  validates_presence_of :title, :rental_price, :sale_price, :stock
  attribute :available, :boolean, default: true
  after_save :update_availability

  has_many :likes, dependent: :destroy
  has_many :transactions, dependent: :destroy

  scope :available, ->(unavailable) { unavailable ? all : where(available: true) }
  scope :filter_by_title, ->(title) { where('lower(title) LIKE ?', "%#{title.downcase}%") }

  private

  def update_availability
    update({ available: false }) if stock <= 0 && available
  end
end
