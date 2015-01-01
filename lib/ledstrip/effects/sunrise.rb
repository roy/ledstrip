module Ledstrip
  module Effects
    class Sunrise < TimedBase

      def step(leds)
        led_size = leds.size
        leds.each(&:off!)

        pos = position

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

    end
  end
end
