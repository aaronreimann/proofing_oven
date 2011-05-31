require 'spec_helper'

describe Filter do
  describe "#klass" do
    subject { Filter.new(:candidate).klass }
    it { should == Candidate }
  end

  describe "#display_all?" do
    subject { Filter.new(:candidate, criteria).display_all? }
    context "with a status of Display All" do
      let(:criteria) { { status: "Display All" } }
      it { should be_true }
    end

    context "with a blank status" do
      let(:criteria) { nil }
      it { should be_true }
    end

    context "with a status of pending" do
      let(:criteria) { { status: "pending" } }
      it { should be_false }
    end
  end

  describe "#refine" do
    let(:filter) { Filter.new(name, criteria) }
    subject { filter.refine }

    context "with a status of pending" do
      let!(:pending_candidate) { Fabricate(:candidate, status: "pending") }
      let!(:hired_candidate) { Fabricate(:candidate, status: "hired") }
      let(:name) { :candidate }
      let(:criteria) { { status: "pending" } }

      it { should == [pending_candidate] }
    end
  end

  describe "#status" do
    subject { Filter.new(:candidate, criteria).status }

    context "pending" do
      let(:criteria) { { status: "pending" } }
      it { should == "pending" }
    end

    context "Display All" do
      let(:criteria) { nil }
      it { should == "Display All" }
    end
  end
end
