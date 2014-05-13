(function(){
  window.CARDGAME.games = {
    show: function(){
      var client = new Faye.Client('//localhost:3000/faye')

      client.subscribe('/match', function (msg) {
        var gameState = JSON.parse(msg.data);
        var activePlayer = gameState.players[gameState.active_player];

        new Game(activePlayer).renderGameState(gameState);
      });
    }
  };

  function Game(activePlayer) {
    this.activePlayer = activePlayer;
  }

  Game.prototype.renderGameState = function(gameState) {
    this.renderPlayers(gameState);
    this.renderHand(gameState);
    this.renderBoard(gameState);
  };

  Game.prototype.renderPlayers = function(gameState) {
    _.each(gameState.players, function(player, idx) {
      var $player = $('.players h3').eq(idx);
      $player.find('.name').html(player.name);
      $player.find('.score').html('('+gameState.scores[player.id]+')');
    });
  };

  Game.prototype.renderHand = function(gameState) {
    var playerHand = gameState.decks[this.activePlayer.id];
    // do hand render
  };

  Game.prototype.renderBoard = function(gameState) {
    var board = gameState.board;
    _.each(gameState.board, function(row, rowIdx) {
      _.each(row, function(cardAtColumn, columnIdx) {
        // do card render
      });
    });
  };

})();
