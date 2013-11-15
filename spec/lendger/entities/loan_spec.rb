require_relative "../unit_helper"
require_relative "../entity_examples"
require "lendger/entities/loan"

describe Loan do
  let(:lender)     { {id: 1, name: "Lender"} }
  let(:borrower)   { {id: 2, name: "Borrower"} }
  let(:attributes) { {id: 3, lender: lender, borrower: borrower} }
  let(:loan)       { Loan.new(attributes) }

  it_behaves_like "a Lendger::Entity"

  describe "#attributes" do
    it "includes a lender" do
      expect(loan.attributes).to include(:lender)
    end
    it "includes a thing" do
      expect(loan.attributes).to include(:thing)
    end
    it "includes a borrower" do
      expect(loan.attributes).to include(:borrower)
    end
  end
end
