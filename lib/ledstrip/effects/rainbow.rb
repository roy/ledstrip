module Ledstrip
  module Effects
    class Rainbow < Base
      
      def step(leds)
        i = @frame
        frequency = 0.3

        leds.collect do |led|
          red   = Math.sin(frequency*i + 0) * 127 + 128
          green = Math.sin(frequency*i + 2) * 127 + 128
          blue  = Math.sin(frequency*i + 4) * 127 + 128

          led.red = red
          led.green = green
          led.blue = blue

          i += 1
          led
        end.reverse
      end

      def sleep_time
        0.1
      end

    end
  end
end
