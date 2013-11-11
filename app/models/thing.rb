require "virtus"

class Thing
  include Virtus.model

  attribute :id, Integer
  attribute :name, String
  attribute :description, String
end
