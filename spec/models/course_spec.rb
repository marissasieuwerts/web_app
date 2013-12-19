require 'spec_helper'

describe Course do
  it { should respond_to(:relationships) }
  
  describe "follower methods" do
    it { should respond_to(:followed) }
    its(:followed) { should eq followed }
  end
end
