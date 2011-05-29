class CandidatesController < ApplicationController
  expose(:candidate)
  expose(:candidates) { Candidate.scoped }
end
