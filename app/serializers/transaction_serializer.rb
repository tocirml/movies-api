class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :customer_email, :price, :created_at

  attribute :movie do |obj|
    MovieSerializer.new(obj.movie).as_json['data']
  end
end
