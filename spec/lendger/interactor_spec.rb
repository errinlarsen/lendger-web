require File.expand_path(File.dirname(__FILE__) + "/unit_helper")
require "lendger/interactor"

describe Lendger::Interactor do
  describe "::Interactor interface" do
    def self.class_methods
      return {new: "(context={})", perform: "(context={})"}
    end
    def self.instance_methods
      return {:fail! => "(*args)", failure?: "", perform: "", rollback: "",
              setup: "", success?: ""}
    end

    class_methods.each do |meth, sig|
      it ".#{meth}#{sig}" do
        n = sig.split(/,\s*/).count
        expect(described_class).to respond_to(meth).with(n).arguments
      end
    end

    instance_methods.each do |meth, sig|
      it "##{meth}#{sig}" do
        n = sig.split(/,\s*/).count
        expect(described_class.new).to respond_to(meth).with(n).arguments
      end
    end
  end
end
