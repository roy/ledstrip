require "spec_helper"
require "ledstrip/type/lpd6803"

include Ledstrip::Type

describe LPD6803 do

  describe "#draw" do

    xit "draws a red led" do
      subject = LPD6803.new
      red_led = Led.new(r: 255, g: 0, b: 0)
      subject.draw([red_led])
    end

  end
end
