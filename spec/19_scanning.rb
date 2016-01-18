require_relative 'spec_helper'

describe Robot do

  before :each do
    @robot = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
    @robot4 = Robot.new
    @robot5 = Robot.new
    @robot6 = Robot.new
  end

  describe "#scanner" do
    it "should be able to check if there are nearby robots and return them" do
      @robot2.move_left
      @robot3.move_right
      @robot4.move_up
      @robot5.move_down
      expect(@robot.scanner.length).to eq(6)
    end
  end
end

