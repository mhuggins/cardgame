module Game
  class Game
    BOARD_SIZE = 3.freeze
    CARD_COUNT = (BOARD_SIZE ** 2 / 2.0).ceil.freeze

    attr_reader :players, :board

    def initialize(player1_name, player2_name)
      @players = [
          Player.new(player1_name, CARD_COUNT),
          Player.new(player2_name, CARD_COUNT),
      ]
      @active_player = 0
      @board = Board.new(BOARD_SIZE, BOARD_SIZE)
    end

    def active_player
      @players[@active_player]
    end

    def play(card_id, x, y)
      card = active_player.card(card_id)
      success = @board.play(x, y, card)

      if success
        active_player.cards.delete(card)
        @active_player = (@active_player + 1) % 2
      end

      success
    end

    def as_json(*)
      {
          players: @players.as_json,
          board: @board.as_json,
          decks: {
              @players[0].id => @players[0].cards.as_json,
              @players[1].id => @players[1].cards.as_json,
          },
          scores: {
              1 => @board.score(@players[0].id),
              2 => @board.score(@players[1].id),
          },
          active_player: active_player.id,
          completed: @board.filled?,
      }
    end
  end
end
