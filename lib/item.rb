class Item

  attr_reader :name, :weight

  def initialize(name = "Rubies", weight = 20)
    @name = name
    @weight = weight
  end

end