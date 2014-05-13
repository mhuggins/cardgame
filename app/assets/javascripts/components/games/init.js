(function(){
  window.CARDGAME.games = {
    show: function(){
      var json = "{\"players\":[{\"id\":1,\"name\":\"Bob\",\"color\":\"blue\"},{\"id\":2,\"name\":\"Matt\",\"color\":\"red\"}],\"board\":[[null,null,null],[null,null,null],[null,null,null]],\"decks\":{\"1\":[{\"id\":1,\"player\":1,\"strengths\":[6,2,2,6]},{\"id\":2,\"player\":1,\"strengths\":[10,10,4,2]},{\"id\":3,\"player\":1,\"strengths\":[5,5,5,7]},{\"id\":4,\"player\":1,\"strengths\":[2,5,3,2]},{\"id\":5,\"player\":1,\"strengths\":[6,10,8,10]}],\"2\":[{\"id\":6,\"player\":2,\"strengths\":[10,1,1,8]},{\"id\":7,\"player\":2,\"strengths\":[2,10,5,4]},{\"id\":8,\"player\":2,\"strengths\":[5,8,7,4]},{\"id\":9,\"player\":2,\"strengths\":[10,5,10,2]},{\"id\":10,\"player\":2,\"strengths\":[8,9,4,7]}]},\"scores\":{\"1\":0,\"2\":0},\"active_player\":1,\"completed\":false}";
      var gameState = JSON.parse(json);
      var activePlayer = gameState.players[Math.floor(Math.random()*2)];

      var game = new Game(activePlayer);
      game.renderGameState(gameState);
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
