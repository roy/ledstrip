require "spec_helper"
require "ledstrip/effects/random"

describe Ledstrip::Effects::Random do
  context "#initialze" do
    it "accepts a strip" do
      strip = double("strip")
      effect = Ledstrip::Effects::Random.new(strip)

      expect(effect.strip).to eq(strip)
    end
  end

  context "#tick" do
    xit "generates random colors" do
      # how to test randomness
    end
  end
end
