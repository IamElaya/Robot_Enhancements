require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end



describe "#heal" do
    it "should throw an error if trying to  heal if it has 0 health or less." do
      @robot.wound(100)
      expect {@robot.heal(20)}.to raise_error Robot::RobotDeadError
    end
end

describe "#attack" do
    item = Item.new
    it "should throw an error if trying to attack a non robot target." do
    expect {@robot.attack(item)}.to raise_error Robot::InvalidTargetError
    end
  end
end