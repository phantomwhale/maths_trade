module Bgg
  class Http
    def self.geeklist
      open('http://http://www.boardgamegeek.com/xmlapi/geeklist/172859')
    end
  end
end
