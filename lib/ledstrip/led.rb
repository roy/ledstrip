module Ledstrip
  class Led

    attr_accessor :r, :g, :b

    def initialize(r: 0, g: 0, b: 0)
      @r, @g, @b = r, g, b
    end

    def red=(value);   @r = value; end
    def green=(value); @g = value; end
    def blue=(value);  @b = value; end
  end
end
