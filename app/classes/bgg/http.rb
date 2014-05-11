require 'open-uri'

module Bgg
  class Http
    def self.geeklist(id)
      open("http://www.boardgamegeek.com/xmlapi/geeklist/#{id}")
    end

    def self.game(id)
      open("http://www.boardgamegeek.com/xmlapi2/thing?id=#{id}")
    end
  end
end
