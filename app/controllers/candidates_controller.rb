class CandidatesController < ApplicationController
  expose(:candidate)
  expose(:candidates) { filtered.refine }
  expose(:filtered) { Filter.new(:candidate, params[:filters]) }

  def create
    flash[:notice] = "Candidate saved successfully"
    respond_with candidate.tap(&:save)
  end
  alias update create

  def filter
    render :index
  end
end
