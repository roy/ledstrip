module Ledstrip
  class Strip

    attr_accessor :leds

    def initialize(led_count, type)
      @leds = []
      @type = type

      init_leds(led_count)
    end

    def draw
      @type.draw(@leds)
    end

    private
    def init_leds(led_count)
      led_count.times { |x| @leds << Led.new(r: 255, g: 255, b: 255) }
    end

  end
end
