require 'faye/websocket'

module Middleware
  class GameServer
    KEEPALIVE_TIME = 15.freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        ws = Faye::WebSocket.new(env, nil, ping: KEEPALIVE_TIME)

        ws.on :open do |event|
          p [:open, ws.object_id]
        end

        ws.on :close do |event|
          p [:close, ws.object_id, event.code, event.reason]
        end

        ws.on :message do |event|
          p [:message, event.data]
        end

        ws.rack_response
      else
        @app.call(env)
      end
    end
  end
end
