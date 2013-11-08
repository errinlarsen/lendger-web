require "virtus"

class Thing
  include Virtus.model

  attribute :name, String
end
