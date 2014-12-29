module Ledstrip
  module Calculations
    def self.kelvin_to_led(kelvin, led)
      # using method described at
      # http://www.tannerhelland.com/4435/convert-temperature-rgb-algorithm-code/
      temp = kelvin / 100

      red = temp <= 66 ? 255 : 329.698727446 * ((temp - 60) ** -0.1332047592)

      green = if temp <= 66
                99.4708025861 * Math.log(temp) - 161.1195681661
              else
                288.1221695283 * ((temp - 60) ** -0.0755148492)
              end

      blue = if temp >= 66
               255
             elsif temp <= 19
               0
             else
               138.5177312231 * Math.log(temp - 10) - 305.0447927307
             end

      led = Ledstrip::Led.new(r: red, g: green, b: blue)
    end

    def self.bounce(pos)
      return 10 if pos >= 10
      (-Math.cos(pos*Math::PI)/2)+0.5
    end
  end
end
