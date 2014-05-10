class Game
  attr_reader :id

  def initialize(id, node)
    @id = id
    @node = node
  end

  def list_item_link
    Bgg.link_to_list_item(@node['id'])
  end

  def bgg_link
    Bgg.link_to_thing(@node['objectid'])
  end

  def name
    @node['objectname']
  end

  def user
    @node['username']
  end

  def to_s
    "#{name}, #{user}"
  end
end
