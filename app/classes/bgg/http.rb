module Bgg
  class Http
    def self.geeklist(id)
      open("http://www.boardgamegeek.com/xmlapi/geeklist/#{id}")
    end
  end
end
