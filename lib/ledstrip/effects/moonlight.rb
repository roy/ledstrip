module Ledstrip
  module Effects
    class Moonlight < Base

      def initialize(strip, options = {})
        super
        @start = Time.now.to_i
        @duration = options.fetch("duration", 30).to_i
        @finish = @start + @duration.to_i
      end

      def position
        time = Time.now.to_i
        pos = time > @finish ? 1 : (time - @start).to_f/@duration
      end

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
