class Battery < Item
  def initialize
    super("Battery", 25)
  end

  def recharge(robot)
    robot.repair_shield(25)
  end

end