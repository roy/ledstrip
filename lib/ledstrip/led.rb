module Ledstrip
  class Led

    attr_accessor :r, :g, :b

    def initialize(:r, :g, :b)
      @r, @g, @b = params.values_at(:r, :g, :b)
    end

  end
end
