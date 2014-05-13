module Game
  class Game
    BOARD_SIZE = 3
    CARD_COUNT = (BOARD_SIZE ^ 2 / 2).ceil

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
      @board.play(x, y, card)
    end

    def to_json
      {
          players: @players.to_json,
          board: @board.to_json,
          decks: {
              1 => @players[0].cards.to_json,
              2 => @players[1].cards.to_json,
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
