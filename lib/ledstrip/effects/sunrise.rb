module Ledstrip
  module Effects
    class Sunrise < Base

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
        leds.each(&:off!)

        pos = position#(position + (x / led_size)) / 2

        if pos <= 0.5
          leds[0,(pos * 2 * led_size).to_i].each do |l|
            l.r = pos * 2 * 255
          end
        elsif pos > 0.5 && pos < 1
          leds.each {|l| l.r = 255 }
          leds[0,((pos - 0.5) * 2 * led_size).to_i].each do |l|
            l.r = 255
            l.g = (pos - 0.5) * 2 * 200
            l.b = (pos - 0.5) * 2 * 50
          end
        else
          leds.each(&:on!)
        end

        leds
      end

      def sleep_time
        0.1
      end

    end
  end
end
