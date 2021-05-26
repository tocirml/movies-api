class LikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :movie, :customer_email
end
