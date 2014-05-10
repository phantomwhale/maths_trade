module Bgg
  class Local
    def self.geeklist(id)
      File.open("#{id}.xml")
    end

    def self.game(id)
      #TODO going to hard code these
      File.open("42052.xml")
    end
  end
end
