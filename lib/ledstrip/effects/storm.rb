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
          led.r = 0
          led.g = 0
          led.b = 0
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
        first_ray = (leds.size / 2 / 2) - 1
        second_ray = (leds.size / 2 + (leds.size / 2 / 2)) + 1

        [first_ray, second_ray].each do |i|
          leds[i].r = 200
          leds[i].g = 200
          leds[i].b = 200
        end
      end

      def sleep_time
        0.1
      end

    end
  end
end
