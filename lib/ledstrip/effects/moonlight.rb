module Ledstrip
  module Effects
    class Moonlight < Base

      def initialize(strip, options = {})
        super
        @start = Time.now
        @duration = options.fetch(:duration, 300)
        @finish = @start + @duration
      end

      def position
        time = Time.now
        pos = time > @finish ? 1 : (time - @start)/@duration
      end

      def step(leds)
        led_size = leds.size

        leds.each_with_index do |led, x|
          led.off!

          if x == (position * 255).to_i
            leds[x - 1 ].b = 128 if leds[x-1]
            led.b = 255
            leds[x + 1 ].b = 128 if leds[x+1]
          end
        end

        leds
      end

    end
  end
end
