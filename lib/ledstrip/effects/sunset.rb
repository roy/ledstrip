module Ledstrip
  module Effects
    class Sunset < TimedBase

      def step(leds)
        leds.each(&:on!)        
        pos = position 
        led_size = leds.size

        if pos <= 0.5
          leds[0,(pos * 2 * led_size).to_i].each do |l|
            l.r = 255
            l.g = 255 - (pos * 2 * 255)
            l.b = 255 - (pos * 2 * 255)
          end
        elsif pos > 0.5 && pos < 1
          leds.each {|l| l.r = 255; l.g = 0; l.b = 0 }
          leds[0,((pos - 0.5) * 2 * led_size).to_i].each do |l|
            l.r = 255 - (pos - 0.5) * 2 * 255
            l.g = 0
            l.b = 0
          end
        else
          leds.each(&:off!)
        end

        leds
      end

    end
  end
end
