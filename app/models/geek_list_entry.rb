class GeekListEntry
  attr_reader :id

  def initialize(id, node)
    @id = id
    @node = node
  end

  def list_entry_link
    Bgg.link_to_list_item(list_entry_id)
  end

  def bgg_link
    Bgg.link_to_thing(game_id)
  end

  def game_id
    @node['objectid']
  end

  def name
    @node['objectname']
  end

  def user
    @node['username']
  end

  def trade_code
    comments = @node.xpath('comment[@username="mr_lunch"]').collect(&:text)[0]
    comments ? comments.scan(/\d{7}-[0-9A-Z]{5}/).first : nil
  end

  def list_entry_id
    @node['id']
  end

  def to_s
    "#{name}, #{user}"
  end
end
