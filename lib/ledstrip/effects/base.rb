module Ledstrip
  module Effects
    class Base

      def initialize(strip, options = {})
        @strip = strip
        @options = options
        @running = false
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

      def run
        while(running) do
          @strip.tick
          sleep @strip.sleep_time
          sleep sleep_time
        end
      end
    end
  end
end
