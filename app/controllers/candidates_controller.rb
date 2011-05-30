class CandidatesController < ApplicationController
  expose(:candidate)
  expose(:candidates) { Candidate.scoped }

  def create
    flash[:notice] = "Candidate saved successfully"
    respond_with candidate.tap(&:save)
  end
  alias update create
end
