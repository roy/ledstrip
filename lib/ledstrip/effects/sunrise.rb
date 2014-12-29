module Ledstrip
  module Effects
    class Sunrise < Base

      def initialize(strip, options = {})
        super
        @start = Time.now
        @duration = options.fetch(:duration, 30)
        @finish = @start + @duration
        @sequence = generate_sequence
        @end_led = Ledstrip::Led.new(r: 255, g: 255, b: 255)
      end

      def position
        time = Time.now
        pos = time > @finish ? 1 : (time - @start)/@duration
      end

      def step(leds)
        led_size = leds.size

        leds.each_with_index do |led, x|
          led.off!

          pos = position#(position + (x / led_size)) / 2
          if pos <= 0.5
            led.r = pos * 2 * 255
          elsif pos > 0.5 && pos <= 1
            led.r = 255
            led.g = (pos - 0.5) * 2 * 200
            led.b = (pos - 0.5) * 2 * 50
          else
            led.on!
            led.r = 255
            led.g = 200
            led.b = 50
          end
        end

        leds
      end

      def sleep_time
        2
      end

      private
      def generate_sequence
        sequence_count = @duration * (1 / sleep_time)
        #sequence = Array.new(sequence_count, Ledstrip::Led.new(r: 0, g: 0, b: 0))
        sequence = []

        max_red = 255
        
        half = (sequence_count / 2).to_i
        other_half = (sequence_count - half).to_i

        half.times do |x|
          led = Led.new(r: 0, g: 0, b: 0)
          led.red = (x.to_f / half) * max_red

          sequence << led
        end

        other_half.times do |x|
          led = Led.new(r: 0, g: 0, b: 0)
          led.red = 255 
          led.green = (x.to_f / other_half) * 255
          led.blue = (x.to_f / other_half) * 255

          sequence << led
        end

        sequence
      end
    end
  end
end
