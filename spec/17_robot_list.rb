require_relative 'spec_helper'

describe Robot do

  before :each do
    @robot = Robot.new
    @robot2 = Robot.new
  end

  describe "#all_instances" do
    it "should return all the robots made" do
      puts Robot.all_instances
      expect(Robot.all_instances.length).to eq(2)
  end

  it "should return correct number if more are added" do
    puts Robot.all_instances
    expect(Robot.all_instances.length).to eq(4)
  end
end
end