require_relative "../entity"
require_relative "person"

class User < Entity
  attribute :login, String
  attribute :person, Person

  def lend(*args)
    person.lend(*args)
  end

  def borrow(*args)
    person.borrow(*args)
  end
end
