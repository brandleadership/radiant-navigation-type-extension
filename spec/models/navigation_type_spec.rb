require File.dirname(__FILE__) + '/../spec_helper'

describe NavigationType do
  before(:each) do
    @navigation_type = NavigationType.new
  end

  it "should not be saved" do
    @navigation_type.save().should be_false
  end
end
  
describe NavigationType do
  before(:each) do
    @navigation_type = NavigationType.new(:name  => 'test')
  end

  it "should be valid" do
    @navigation_type.should be_valid
  end

  it "should be saved and have correct name" do
    @navigation_type.save().should be_true
    @navigation_type.name.should == 'test'
  end

end
