class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :rental_price, :stock, :sale_price, :available
end
