module Ledstrip
  module Effects
    class TimedBase < Base
      
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

      def sleep_time
        0.1
      end

    end
  end
end
