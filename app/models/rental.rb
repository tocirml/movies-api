class Rental < Transaction
  before_save :add_price

  private

  def add_price
    self.price = movie.rental_price
  end
end
