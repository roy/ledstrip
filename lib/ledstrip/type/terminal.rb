module Ledstrip
  module Type
    class Terminal
      def draw(leds)
        clear_screen
        write_leds(leds)
      end

      private
      def clear_screen
        system("clear")
      end

      def write_leds(leds)
        leds.each do |led|
          write_led(led)
        end
      end

      def write_led(led)
        print_color(rgb(led.r, led.g, led.b))
      end

      def print_color(color)
        print "\x1b[48;5;#{color}m"
        print "  "
        reset_color
      end

      def reset_color
        print "\x1b[0m"
      end

      def rgb(red, green, blue)
        16 + (to_ansi_domain(red) * 36) + (to_ansi_domain(green) * 6) + to_ansi_domain(blue)
      end

      def to_ansi_domain(value)
        (6 * (value / 256.0)).to_i
      end
    end
  end
end
