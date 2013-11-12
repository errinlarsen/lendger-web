require "virtus"
require_relative "thing"
require_relative "person"

class Loan
  include Virtus.model(finalize: false)

  attribute :id, Integer
  attribute :thing, "Thing"
  attribute :lender, "Person"
  attribute :borrower, "Person"
end
