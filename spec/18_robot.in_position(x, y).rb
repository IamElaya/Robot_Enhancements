require_relative 'spec_helper'

describe Robot do

  before :each do
    @robot = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
  end

  describe "#robot_position" do
    it "should return all the robots in the specified location" do
    @robot.move_left
    @robot2.move_left
    @robot3.move_left
    expect(Robot.robot_position(-1, 0).length).to eq(3)
  end
end
end