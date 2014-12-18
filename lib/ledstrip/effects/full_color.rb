module Ledstrip
  module Effects
    class FullColor < Base

      def step(leds)
        leds.collect do |led|
          led.red = @options["r"].to_i
          led.green = @options["g"].to_i
          led.blue = @options["b"].to_i

          led
        end
      end

    end
  end
end
