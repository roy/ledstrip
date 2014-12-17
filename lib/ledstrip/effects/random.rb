module Ledstrip
  module Effects
    class Random < Base

      def step(leds)
        next_state(leds)
      end

      private
      def next_state(leds)
        leds.collect do |led|
          led.red = rand(255)
          led.green = rand(255)
          led.blue = rand(255)
          led
        end
      end

    end
  end
end
