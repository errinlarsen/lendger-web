require File.expand_path(File.dirname(__FILE__) + "/unit_helper")
require "models/thing"

describe Thing do
  let(:attributes) { {id: 1, name: "foo", description: "bar"} }
  let(:thing) { Thing.new(attributes) }

  describe ".new" do
    it "accepts a Hash of attributes" do
      expect { thing }.not_to raise_error
    end
  end

  describe "#attributes" do
    it "includes an id" do
      expect(thing.attributes).to include(id: 1)
    end
    it "includes a name" do
      expect(thing.attributes).to include(name: "foo")
    end
    it "includes an (optional) description" do
      expect(thing.attributes).to include(description: "bar")
      expect { @other_thing = Thing.new(id: 1, name: "foo") }.to_not raise_error
      expect(@other_thing.description).to be_nil
    end
  end
end
