module Extensions
  class Match
    def incoming(message, callback)
      puts 'INCOMING'
      callback.call(message)
    end

    def outgoing(message, callback)
      puts 'OUTGOING'
      callback.call(message)
    end
  end
end
