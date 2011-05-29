require 'spec_helper'

describe Candidate do
  describe "#full_name" do
    let!(:candidate) { Fabricate(:candidate, first_name: "Aaron", last_name: "Chickenhead") }
    subject { candidate.full_name }
    it { should == "Aaron Chickenhead" }
  end
end
