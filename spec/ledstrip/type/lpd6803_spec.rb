require "spec_helper"
require "ledstrip/type/lpd6803"

include Ledstrip::Type

describe LPD6803 do

  describe "#draw" do

    it "draws a red led" do
      subject = LPD6803.new
      red_led = Ledstrip::Led.new(r: 255, g: 0, b: 0)

      allow(subject).to receive(:write)
      subject.draw([red_led])

      result = [0,0,0,0,0b11111100, 0b00000000, 0]
      expect(subject).to have_received(:write).with(result)
    end

    context "with different order" do
      it "draws a red led" do
        subject = LPD6803.new(order: [:g, :r, :b])
        red_led = Ledstrip::Led.new(r: 255, g: 0, b: 0)

        allow(subject).to receive(:write)

        result = [0,0,0,0,0b10000011, 0b11100000, 0]
        subject.draw([red_led])

        expect(subject).to have_received(:write).with(result)
      end
    end

  end
end
