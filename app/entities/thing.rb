require_relative "entity"

class Thing < Entity
  attribute :name, String
  attribute :description, String
end
