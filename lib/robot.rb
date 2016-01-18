class Robot

  
 

  # def norobots
  #   raise NoRobotError, "No Robots!" if @@robots.empty?
  #   @@robots
  # end

  class RobotDeadError < StandardError
  end

  class InvalidTargetError < StandardError
  end

  # class << self
   

  MAX_WEIGHT = 250
  DEFAULT_ATTACK = 5

  @@robots = Array.new

  attr_reader :move_left, :move_right, :move_up, :move_down, :robot_position, :scanner, :position, :items, :health, :shield, :pick_up, :items_weight, :wound, :heal, :attack
  attr_accessor :equipped_weapon 

  def self.all_instances
    @@robots
  end

  def initialize (position = [0, 0], items = [], health = 100, shield = 50)
    @position = position
    @items = items
    @health = health
    @equipped_weapon = equipped_weapon
    @shield = shield
    @@robots << self
  end


  def move_left
    @position[0] -=1
  end

  def move_right
    @position[0] +=1
  end

  def move_up
    @position[1] +=1
  end

  def move_down
    @position[1] -=1
  end

  def self.robot_position(x, y)
     @position_array = []
     # robot_list = Robot.all_instances
     @@robots.each do |robot| 
     if (robot.position[0] == x) && (robot.position[1] == y)
     @position_array.push(robot) 
     end
      @position_array
     end
  end

  def robot_vertical?
    ( self.position[0] + 1 ) && ( self.position[0] - 1 )
  end

  def robot_horizontal?
    (self.position[1] + 1) && (self.position[1] - 1 )
  end


  def scanner
    @scan_array = []
    @@robots.each do |other|
    if other.position[0] == ( self.position[0] || self.robot_vertical? ) || other.position[1] == ( self.position[1]  || self.robot_horizontal? )
      @scan_array.push(other)
    end
      @scan_array
    end
  end

  def pick_up(item)
      if health > 80
        if item.is_a? Weapon
          @equipped_weapon = item
        end
      else
        if health <= 80
          item.feed(self)
        end
      end
      unless items_weight + item.weight > MAX_WEIGHT
        @items<<item
    end
  end

  def items_weight
      weight = 0
      @items.each do |item|
      weight += item.weight
    end
      weight
  end


  def repair_shield(amount)
    new_shield = @shield += amount
    if new_shield > 50
      @shield = 50
    else
      new_shield
    end
  end

  def has_shield?
    @health == 100
  end

  # def break(amount)
  #   if self.has_shield?
  #     if amount <= 50
  #       @shield -= amount
  #     else


  def wound(amount)
    if self.has_shield?
      if amount <= 50
        @shield -= amount
      else
        if amount > 50
          @shield  -=  50
          leftover = amount - 50
          @health -= leftover
        end
      end
      #   if amount >= 100
      #      amount = 100
      #   end
      # else
    else
       @health -= amount
    end
  end

  def heal(amount)
    raise RobotDeadError, "Robot is dead, can't heal." if @health <= 0
    new_life = @health += amount
    if new_life > 100
    @health = 100
    else
    new_life 
    end
  end

  # def heal!(amount)
   
  # end 

  # def enemy_close?
    
  # end

  # def enemy_grenadeable?
    
  # end


  def attack(enemy)
    raise InvalidTargetError, "Cannot attack this target" if enemy.is_a? Item
    if equipped_weapon.is_a? Grenade
      if @position[1] == enemy.position[1] - 2  || @position[1] == enemy.position[1] +2
        equipped_weapon.hit(enemy)
        @equipped_weapon = nil
    elsif @position[1] == enemy.position[1] - 1  || @position[1] == enemy.position[1] +1
      if equipped_weapon 
          equipped_weapon.hit(enemy)
          @equipped_weapon = nil if equipped_weapon.is_a? Grenade
      else
        enemy.wound(DEFAULT_ATTACK)
      end
        else
          puts "Cannot attack."
      end
    end
  end

  # def attack!(enemy)
    
  # end

 # end
end
