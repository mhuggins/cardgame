module Game
  class Player
    attr_reader :id, :name, :cards

    def initialize(name, deck_size)
      @id = self.class.generate_id
      @name = name
      @cards = Card.generate(self, deck_size)
    end

    def card(id)
      @cards.find { |card| card.id == id }
    end

    def color
      id % 2 == 0 ? 'red' : 'blue'
    end

    def as_json(*)
      { id: id, name: name, color: color }
    end

    def self.generate_id
      @id ||= 0
      @id += 1
    end
  end
end
