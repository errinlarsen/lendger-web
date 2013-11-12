require "active_model"
require "virtus"

class Entity
  include ActiveModel::Validations
  include Virtus.model

  attribute :id, Integer
end
