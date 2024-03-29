module Bgg
  class << self
    def adapter
      @adapter ||= Rails.env.development? ? Bgg::Local : Bgg::Http
    end

    def adapter=(clazz)
      @adapter = clazz
    end

    def geek_list(id = GeekList::AUSSIE_MID_YEAR_2014_ID)
      @geek_list ||= GeekList.new(Nokogiri::XML(adapter.geeklist(id)))
    end

    def game_entry(id)
      file = Bgg.adapter.game(id)
      GameEntry.new(Nokogiri::XML(file))
    end

    def link_to_user(user)
      "http://www.boardgamegeek.com/user/#{user}" 
    end

    def link_to_thing(thing_id)
      "http://www.boardgamegeek.com/thing/#{thing_id}"
    end

    def link_to_list_item(item_id)
      "http://www.boardgamegeek.com/geeklist/item/#{item_id}"
    end
  end
end
