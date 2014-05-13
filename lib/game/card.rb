module Game
  class Card
    attr_reader :id, :player, :strength_top, :strength_right, :strength_bottom, :strength_left

    def initialize(player, strength_top, strength_right, strength_bottom, strength_left)
      @id = self.class.generate_id
      @player = player
      @strength_top = strength_top
      @strength_right = strength_right
      @strength_bottom = strength_bottom
      @strength_left = strength_left
    end

    def to_json
      { player: player.id, strengths: [strength_top, strength_right, strength_bottom, strength_left] }.to_json
    end

    def self.generate(player, count, combined_value = 20)
      count.times.map do
        max_side_value = [combined_value / 4, 10].min

        values = 4.times.map do
          val = [combined_value, (1..max_side_value).to_a.sample].min
          combined_value -= val
          val
        end

        new(player, *values)
      end
    end

    def self.generate_id
      @id ||= 0
      @id += 1
    end
  end
end
