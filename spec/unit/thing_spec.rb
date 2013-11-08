require File.expand_path(File.dirname(__FILE__) + "/unit_helper")
require "models/thing"

describe Thing do
  describe ".new" do
    it "creates a new Thing" do
      expect(Thing.new).to be_a(Thing)
    end
    it "accepts a Hash of attributes" do
      expect { Thing.new(name: "foobar") }.not_to raise_error
    end
  end

  describe "Attributes" do
    let(:attributes) { {name: "foobar"} }
    let(:thing) { Thing.new(attributes) }

    it "includes a name" do
      expect(thing.name).to eql("foobar")
      thing.name = "Something else"
      expect(thing.name).to eql("Something else")
    end
  end
end
