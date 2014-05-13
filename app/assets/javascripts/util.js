UTIL = {
  exec: function( controller, action ) {
    var ns = CARDGAME;
    action = ( action === undefined ) ? "init" : action;

    // New is reserved and breaks qt-webkit
    // Rename all new actions to new_action for now.
    if ( action === "new" ) action = "new_action";

    if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) {
      ns[controller][action]();
    }
  },

  init: function() {
    var body = document.body,
        controller = body.getAttribute( "data-controller" ),
        action = body.getAttribute( "data-action" );

    UTIL.exec( "common" );
    UTIL.exec( controller );
    UTIL.exec( controller, action );
  }
};

$( document ).ready( UTIL.init );
