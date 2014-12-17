module Ledstrip
  module Effects
    class Base

      def initialize(options = {})
        @options = options
      end

      def sleep_time
        1
      end
    end
  end
end
