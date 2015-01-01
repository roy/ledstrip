module Ledstrip
  module Effects
    class Storm < Base

      def step(leds)
        set_gray(leds)
        set_rays(leds)

        set_thunder(leds)

        leds
      end

      def set_gray(leds)
        leds.each do |led|
          led.r = 30
          led.g = 30
          led.b = 30
        end
      end

      def thunder_hash
        @thunder_hash ||= Hash.new do |hash, key|
          hash[key] = (0..100).to_a.sample(rand(15))
        end
      end

      def set_thunder(leds)
        thunders = thunder_hash[Time.now.to_i / 10]

        if thunders.include? (Time.now.to_f * 10).to_s[-2..-1].to_i
          leds[rand(leds.size)].on!
        end
      end
      
      def set_rays(leds)
        first_ray = leds.size / 2 / 2
        second_ray = leds.size / 2
        third_ray = leds.size / 2 + (leds.size / 2 / 2)

        [first_ray, second_ray, third_ray].each do |i|
          leds[i].r = 128
          leds[i].g = 128
          leds[i].b = 128
        end
      end

      def sleep_time
        0.1
      end

    end
  end
end
