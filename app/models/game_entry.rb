class GameEntry
  attr_reader :id

  def initialize(doc)
    @root = doc.root
  end

  def name
    @root.at_xpath('//name')['value']
  end
end
