class Sale < Transaction
  before_save :add_price

  private

  def add_price
    self.price = movie.sale_price
  end
end
