require File.expand_path(File.dirname(__FILE__) + "/unit_helper")
require "models/person"

describe Person do
  describe ".new" do
    it "creates a new Person" do
      expect(Person.new).to be_a(Person)
    end
    it "accepts a Hash of attribute" do
      expect { Person.new(name: "foobar") }.not_to raise_error
    end
    it "accepts a second, optional Hash of options" do
      expect { Person.new({name: "foobar"}, foo_opt: :bar) }.not_to raise_error
    end
    it "raises Person::UnknownAttributeError with an unknown attribute" do
      expect { Person.new(foo: :bar) }
        .to raise_error Person::UnknownAttributeError
    end
  end

  describe "Attributes" do
    let(:attributes) { {name: "foobar", email: "foo@bar.com"} }
    let(:subject) { Person.new(attributes) }

    it ":name" do
      expect(subject.name).to eql("foobar")
      subject.name = "something else"
      expect(subject.name).to eql("something else")
    end
    it ":email" do
      expect(subject.email).to eql("foo@bar.com")
      subject.email = "something@else.com"
      expect(subject.email).to eql("something@else.com")
    end
  end
end
