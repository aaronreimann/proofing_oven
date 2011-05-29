require 'spec_helper'

describe User do
  describe "#full_name" do
    let!(:user) { Fabricate(:user, first_name: "Aaron", last_name: "Chickenhead") }
    subject { user.full_name }
    it { should == "Aaron Chickenhead" }
  end
end
