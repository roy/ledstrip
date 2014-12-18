module Ledstrip
  module Effects
    def self.instantiate(strip, name, options)
      effect = Object.const_get("Ledstrip::Effects::#{name}")
      effect.new(strip, options)
    end
  end
end
