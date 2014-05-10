class GeekList
  def initialize(doc)
    @root = doc.root
  end

  def num_items
    @root.at_xpath('numitems').text.to_i 
  end

  def games
    index = 0
    @root.xpath('item').map { |node|
      index = index + 1
      Game.new(index, node)
    }
  end
end
