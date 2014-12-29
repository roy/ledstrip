module Ledstrip
  module Effects
    class Sunrise < Base

      def initialize(strip, options = {})
        super
        @start = Time.now.to_i
        @duration = options.fetch("duration", 30)
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

          pos = position#(position + (x / led_size)) / 2
          if pos <= 0.5
            led.r = pos * 2 * 255
          elsif pos > 0.5 && pos <= 1
            led.r = 255
            led.g = (pos - 0.5) * 2 * 200
            led.b = (pos - 0.5) * 2 * 50
          else
            led.on!
            led.r = 255
            led.g = 200
            led.b = 50
          end
        end

        leds
      end

      def sleep_time
        0.1
      end

    end
  end
end
