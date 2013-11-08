require File.expand_path(File.dirname(__FILE__) + "/unit_helper")
require "models/person"

describe Person do
  describe ".new" do
    it "creates a new Person" do
      expect(Person.new).to be_a(Person)
    end
    it "accepts a Hash of attributes" do
      expect { Person.new(name: "foobar") }.not_to raise_error
    end
  end

  describe "Attributes" do
    let(:attributes) { {name: "foobar", email: "foo@bar.com"} }
    let(:person) { Person.new(attributes) }

    it "includes a name" do
      expect(person.name).to eql("foobar")
      person.name = "Something else"
      expect(person.name).to eql("Something else")
    end
    it "includes an email" do
      expect(person.email).to eql("foo@bar.com")
      person.email = "something@else.com"
      expect(person.email).to eql("something@else.com")
    end
  end
end
