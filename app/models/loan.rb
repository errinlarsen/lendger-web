require "virtus"
require_relative "thing"
require_relative "person"

class Loan
  include Virtus.model

  attribute :id, Integer
  attribute :lender, Person
  attribute :borrower, Person
  attribute :thing, Thing
end
