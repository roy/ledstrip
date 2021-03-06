module Ledstrip
  class Led

    attr_accessor :r, :g, :b

    def initialize(r: 0, g: 0, b: 0)
      @r, @g, @b = r.to_i, g.to_i, b.to_i
    end

    def red=(value);   @r = value.to_i; end
    def green=(value); @g = value.to_i; end
    def blue=(value);  @b = value.to_i; end

    def off!
      @r, @g, @b = 0, 0, 0
    end

    def on!
      @r, @g, @b = 255, 255, 255
    end

  end
end
