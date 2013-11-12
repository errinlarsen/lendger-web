require "rspec/autorun"

$LOAD_PATH << File.expand_path("../../../app", __FILE__)

RSpec.configure do |config|
  config.order = "random"

  # Finalize constants manually to resolve circular dependencies in Virtus
  # TODO: this feels hack-y/sloppy
  config.before(:suite) { Virtus.finalize }
end
