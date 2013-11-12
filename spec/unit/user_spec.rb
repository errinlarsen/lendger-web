require File.expand_path(File.dirname(__FILE__) + "/unit_helper")
require "models/user"

describe User do
  let(:attributes) { {id: 1, login: "foo", email: "foo@bar.com"} }
  let(:user) { User.new(attributes) }

  describe ".new" do
    it "accepts a Hash of attributes" do
      expect { user }.not_to raise_error
    end
  end

  describe "#attributes" do
    it "includes an id" do
      expect(user.attributes).to include(id: 1)
    end
    it "includes a login" do
      expect(user.attributes).to include(login: "foo")
    end
    it "includes a person" do
      expect(user.attributes).to include(:person)
    end
  end
end
