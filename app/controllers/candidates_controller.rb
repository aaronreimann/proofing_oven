class CandidatesController < ApplicationController
  expose(:candidate)
  expose(:candidates) { Candidate.scoped }

  def update
    flash[:notice] = "Candidate saved successfully"
    respond_with candidate.tap(&:save)
  end
end
