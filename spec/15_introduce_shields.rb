require_relative 'spec_helper'

describe Robot do

  before :each do
    @robot = Robot.new
  end

describe "#wound" do
  it "should damage the shield first if health is full." do
    @robot.wound(100)
    expect(@robot.health).to eq(50)
  end
end

end