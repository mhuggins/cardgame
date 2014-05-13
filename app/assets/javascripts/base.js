var CARDGAME = {
  init: function (name) {
    console.log('hey');
    var client = new Faye.Client('//localhost:3000/faye')

    client.subscribe('/name', function (msg) {
      console.log(msg);
    });

    client.publish('/name', { action: 'move', card_id: 1, x: 2, y: 3 });
  }
};

CARDGAME.init('matt');
