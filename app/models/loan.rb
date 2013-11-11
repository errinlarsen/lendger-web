require "virtus"
require "models/person"

class Loan
  include Virtus.model

  attribute :id, Integer
  attribute :lender, Person
  attribute :borrower, Person
end
