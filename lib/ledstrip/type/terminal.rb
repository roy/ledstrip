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
        leds.each_with_index do |led, x|
          print_color(x + 1, rgb(led.r, led.g, led.b))
        end
      end

      def print_color(pos, color)
        print "\x1b[48;5;#{color}m"
        print "\x1b[38;5;235m"
        print " #{pos % 10} "
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
