module Ledstrip
  module Effects
    class FullColor < Base

      def step(leds)
        leds.collect do |led|
          led.red = @options[:r]
          led.green = @options[:g]
          led.blue = @options[:b]
          led
        end
      end

    end
  end
end
