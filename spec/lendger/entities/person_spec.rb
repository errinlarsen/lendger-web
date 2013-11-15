require_relative "../unit_helper"
require_relative "../entity_examples"
require "lendger/entities/person"

describe Person do
  let(:attributes) { {id: 1, name: "foobar", email: "foo@bar.com"} }
  let(:person) { Person.new(attributes) }

  it_behaves_like "a Lendger::Entity"

  describe "#attributes" do
    it "includes a name" do
      expect(person.attributes).to include(name: "foobar")
    end
    it "includes an email" do
      expect(person.attributes).to include(email: "foo@bar.com")
    end
    it "includes a loans collection" do
      expect(person.attributes).to include(:loans)
      expect(person.attributes[:loans]).to respond_to(:each)
    end
  end

  describe "#lend(thing, borrower)" do
    let(:thing) { {name: "foo"} }
    let(:borrower) { {name: "bar"} }
    let(:new_loan) { person.lend(thing, borrower) }
    let(:expected_loan_attributes) do
      {lender: person, thing: thing, borrower: borrower}
    end

    it "adds a new loan to its loans collection" do
      expect(person.loans).to include(new_loan)
    end
    it "returns a new loan with itself as the :lender" do
      expect(new_loan.lender).to eql(person)
    end
    it "returns a new loan with the correctl associations" do
      expect(new_loan.thing[:name]).to eql(thing[:name])
      expect(new_loan.borrower[:name]).to eql(borrower[:name])
    end
  end

  describe "#borrow(thing, lender)" do
    let(:thing) { {name: "foo"} }
    let(:lender) { {name: "bar"} }
    let(:new_loan) { person.borrow(thing, lender) }

    it "adds a new loan to its loans collection" do
      expect(person.loans).to include(new_loan)
    end
    it "returns a new loan with itself as the :borrower" do
      expect(new_loan.borrower).to eql(person)
    end
    it "returns a new loan with the correct associations" do
      expect(new_loan.thing[:name]).to eql(thing[:name])
      expect(new_loan.lender[:name]).to eql(lender[:name])
    end
  end
end
