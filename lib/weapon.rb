class Weapon < Item

  attr_reader :damage, :range, :hit

  def initialize(name, weight, damage, range = nil)
    super(name, weight)
      @damage = damage
      @range = range
    end

  def hit(enemy)
    enemy.wound(damage)
  end
end