shared_examples "a Lendger::Entity" do
  subject(:entity) { described_class.new(id: 1) }

  describe ".new" do
    it "accepts a Hash of attributes" do
      expect { entity }.not_to raise_error
    end
  end

  describe "#attributes" do
    it "includes an id" do
      expect(entity.attributes).to include(id: 1)
    end
  end
end
