class Game
  attr_reader :id

  def initialize(id, node)
    @id = id
    @node = node
  end

  def name
    @node['objectname']
  end

  def user
    @node['username']
  end

  def to_s
    "#{id}, #{name}, #{user}"
  end
end
