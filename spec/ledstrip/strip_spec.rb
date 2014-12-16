require "spec_helper"
require "ledstrip/strip"

describe Ledstrip::Strip do

  context "#initialize" do

    it "accepts a type" do
      type = double
      expect{ Ledstrip::Strip.new(30, type) }.to_not raise_error
    end

  end

  context "#draw" do

    it "delegates to type" do
      type = double("type")
      allow(type).to receive(:draw)

      subject = Ledstrip::Strip.new(1, type)
      subject.draw

      expect(type).to have_received(:draw).with(subject.leds)
    end

  end
end
