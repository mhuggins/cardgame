module Game
  class Board
    def initialize(width = 3, height = 3)
      @tiles = Array.new(height) { Array.new(width) }
    end

    def filled?
      @tiles.each do |row|
        row.each do |tile|
          return false if tile.nil?
        end
      end

      true
    end

    def available?(x, y)
      @tiles[x][y].nil?
    end

    def play(x, y, card)
      if available?(x, y)
        @tiles[x][y] = card
        true
      else
        false
      end
    end

    def score(player_id)
      @tiles.select { |card| card && card.player.id == player_id }.count
    end

    def to_json
      obj = @tiles.map do |row|
        row.map(&:to_json)
      end

      obj.to_json
    end
  end
end
