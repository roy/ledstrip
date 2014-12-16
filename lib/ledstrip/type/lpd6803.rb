module Ledstrip
  module Type
    class LPD6803
      def initialize
      end

      def draw(leds)
        write_start_bytes
        write_leds(leds)
        write_end_bytes(leds.size)
      end

      def write(array)
        PiPiper::Spi.spidev_out(array)
        # File.open('/dev/spidev0.0', 'wb'){|f| f.write(array.pack('C*')) }
      end

      private
      def write_start_bytes
        # 32 bits start frame
        write([0,0,0,0])
      end

      def write_leds(leds)
        leds.each do |led|
          write_led(led)
        end
      end

      def write_led(led)
        bits = 0b1000000000000000
        bits |= ((led.r / 255) * 31) << 10
        bits |= ((led.g / 255) * 31) << 5
        bits |= ((led.b / 255) * 31) 

        output = []
        output[0] = (bits & 0xff00) >> 8
        output[1] = (bits & 0x00ff) >> 0
        write(output)
      end

      def write_end_bytes(size)
        # two versions found online, one is to use bits per led other is bytes per led
        write(Array.new(size / 8 + 1, 0))
        # write(Array.new(size, 0))
      end
    end
  end
end
