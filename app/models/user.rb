require "virtus"
require_relative "person"

class User
  include Virtus.model

  attribute :id, Integer
  attribute :login, String
  attribute :person, Person

  def lend(*args)
    person.lend(*args)
  end

  def borrow(*args)
    person.borrow(*args)
  end
end
