require "virtus"
require_relative "loan"

class Person
  include Virtus.model(finalize: false)

  attribute :id, Integer
  attribute :name, String
  attribute :email, String
  attribute :loans, Array['Loan']
end

Virtus.finalize  # Finalize constants manually to resolve circular dependencies
