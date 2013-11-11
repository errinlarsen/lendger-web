require File.expand_path(File.dirname(__FILE__) + "/unit_helper")
require "models/person"

describe Person do
  let(:attributes) { {name: "foobar", email: "foo@bar.com"} }
  let(:person) { Person.new(attributes) }

  describe ".new" do
    it "accepts a Hash of attributes" do
      expect { person.attributes }.not_to raise_error
    end
  end

  describe "#attributes" do
    it "includes a name" do
      expect(person.attributes).to include(name: "foobar")
    end
    it "includes an email" do
      expect(person.attributes).to include(email: "foo@bar.com")
    end
  end
end
