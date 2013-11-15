require_relative "../entity"
require_relative "thing"
require_relative "person"

class Loan < Entity
  include Virtus.model(finalize: false)

  attribute :lender, "Person"
  attribute :thing, "Thing"
  attribute :borrower, "Person"
end
