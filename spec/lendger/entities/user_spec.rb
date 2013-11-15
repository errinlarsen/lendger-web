require_relative "../unit_helper"
require_relative "../entity_examples"
require "lendger/entities/user"

describe User do
  let(:attributes) { {id: 1, login: "foo", email: "foo@bar.com"} }
  let(:user) { User.new(attributes) }

  it_behaves_like "a Lendger::Entity"

  describe "#attributes" do
    it "includes a login" do
      expect(user.attributes).to include(login: "foo")
    end
    it "includes a person" do
      expect(user.attributes).to include(:person)
    end
  end
end
