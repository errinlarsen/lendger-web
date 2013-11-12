require "virtus"
require_relative "person"

class User
  include Virtus.model

  attribute :id, Integer
  attribute :login, String
  attribute :person, Person
end
