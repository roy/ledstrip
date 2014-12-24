module Ledstrip
  module Type
    class LPD6803
      def initialize(order: [:r, :g, :b])
        @order = order
      end

      def draw(leds)
        bytes = []
        bytes << start_bytes
        bytes << led_bytes(leds)
        bytes << end_bytes(leds.size)

        write(bytes.flatten)
      end

      def write(array)
        File.open('/dev/spidev0.0', 'wb'){|f| f.write(array.pack('C*')) }
      end

      private
      def start_bytes
        # 32 bits start frame
        [0,0,0,0]
      end

      def led_bytes(leds)
        bytes = leds.collect do |led|
          led_byte(led)
        end.flatten
      end

      def led_byte(led)
        bits = 0b1000000000000000
        bits |= ((first_part(led)  / 255) * 31).to_i << 10
        bits |= ((second_part(led) / 255) * 31).to_i << 5
        bits |= ((third_part(led)  / 255) * 31).to_i 

        output = []
        output[0] = (bits & 0xff00) >> 8
        output[1] = (bits & 0x00ff) >> 0

        output
      end

      def first_part(led);  led.send(@order[0]).to_f; end
      def second_part(led); led.send(@order[1]).to_f; end
      def third_part(led);  led.send(@order[2]).to_f; end

      def end_bytes(size)
        # two versions found online, one is to use bits per led other is bytes per led
        Array.new(size / 8 + 1, 0)
        # write(Array.new(size, 0))
      end
    end
  end
end
