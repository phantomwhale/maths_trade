module Bgg
  class Local
    def self.geeklist(id)
      File.open("#{id}.xml")
    end
  end
end
