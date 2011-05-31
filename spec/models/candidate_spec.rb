require 'spec_helper'

describe Candidate do
  describe ".filter" do
    let!(:pending_candidate) { Fabricate(:candidate, status: "pending") }
    let!(:hired_candidate) { Fabricate(:candidate, status: "hired") }
    subject { Candidate.filter(params) }

    context "filter by status of pending" do
      let(:params) { { status: "pending" } }
      it { should == [pending_candidate] }
    end
  end

  describe "#full_name" do
    let!(:candidate) { Fabricate(:candidate, first_name: "Aaron", last_name: "Chickenhead") }
    subject { candidate.full_name }
    it { should == "Aaron Chickenhead" }
  end
end
