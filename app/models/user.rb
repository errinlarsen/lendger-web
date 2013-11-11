require "virtus"

class User
  include Virtus.model

  attribute :id, Integer
  attribute :login, String
  attribute :email, String
end
