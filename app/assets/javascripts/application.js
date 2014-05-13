// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.ui.draggable
//= require jquery.ui.droppable
//= require jquery_ujs
//= require base
//= require util
//= require_tree ./components
//= require_tree .

jQuery(function ($) {
  $('.game-card').draggable({
    cancel:         '.board',
    snap:           '.board .game-card',
    snapMode:       'inner',
    revert:         'invalid',
    revertDuration: 200,
    scroll:         false,
    appendTo:       'body',
    helper:         'clone'
  });

  $('.board .game-card').droppable({
    accept: '.game-card',
    drop: function (event, ui) {
      ui.draggable.detach().css({'background-color': 'red'}).appendTo(this);
    }
  });
});
