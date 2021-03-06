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
      count = 0

      @tiles.each do |row|
        row.each do |card|
          count += 1 if card && card.player.id == player_id
        end
      end

      count
    end

    def as_json(*)
      @tiles.map { |row| row.map(&:as_json) }.as_json
    end
  end
end
