require_relative 'spec_helper'

describe Robot do

  before :each do
    @battery = Battery.new
  end




describe "#recharge" do
   before :each do
    @robot = Robot.new
  end

  it "should have a damaged shield." do
    @robot.wound(50)
    expect(@robot.shield).to eq(0)
  end

  it "repairs the robot's battery for 25pts" do
    expect(@robot).to receive(:repair_shield).with(25)
    @battery.recharge(@robot)
  end
end
end
