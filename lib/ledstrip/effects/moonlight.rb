module Ledstrip
  module Effects
    class Moonlight < TimedBase

      def step(leds)
        led_size = leds.size

        leds.each_with_index do |led, x|
          led.off!

          if x == (position * led_size).to_i
            led.b = 255
          end
        end

        leds
      end

    end
  end
end
