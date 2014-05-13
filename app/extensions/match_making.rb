require 'set'

module Extensions
  class MatchMaking
    def initialize
      @players = Set.new

      Thread.new do
        loop do
          create_matches
          sleep 1
        end
      end
    end

    def incoming(message, callback)
      if message['channel'].start_with?('/private/') && message['data'].is_a?(Hash) && message['data']['action'] == 'join'
        @players << message['data']['name']
      end

      callback.call(message)
    end

    private

    def create_matches
      if @players.size >= 2
        game_players = [@players.shift, @players.shift]
        game = Game::Game.new(game_players[0].name, game_players[1].name)

        game_players.each do |player_name|
          publish("/private/#{player_name}", action: 'start', data: game.as_json)
        end
      end
    end
  end
end
