require_relative "../unit_helper"
require_relative "../entity_examples"
require "lendger/entities/thing"

describe Thing do
  let(:attributes) { {id: 1, name: "foo", description: "bar"} }
  let(:thing) { Thing.new(attributes) }

  it_behaves_like "a Lendger::Entity"

  describe "#attributes" do
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
