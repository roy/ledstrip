module Ledstrip
  module Effects
    class Base

      attr_accessor :running

      def initialize(strip, options = {})
        @strip = strip
        @options = options
        @running = false
        @frame = 1 
      end

      def sleep_time
        1
      end

      def start
        @running = true
        run
      end

      def stop
        @running = false
      end

      def tick
        @strip.leds = step(@strip.leds)
        @strip.draw
        @frame += 1
      end

      def run
        Thread.new do
          while(running) do
            tick
            sleep sleep_time
          end
        end
      end

    end
  end
end
