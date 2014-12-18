module Ledstrip
  class Strip

    attr_accessor :leds, :effect

    def initialize(led_count, type:)
      @leds = []
      @type = type

      init_leds(led_count)
    end

    def set_effect(name, options={})
      @effect.stop if @effect
      @effect = Ledstrip::Effects.instantiate(self, name, options) 
      @effect.start
    end

    def draw
      @type.draw(@leds)
    end

    def sleep_time
      @effect.sleep_time
    end

    private
    def init_leds(led_count)
      led_count.times { |x| @leds << Led.new(r: 255, g: 255, b: 255) }
    end

  end
end
