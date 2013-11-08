require "virtus"

class Person
  include Virtus.model

  attribute :name, String
  attribute :email, String
end
