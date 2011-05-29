class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.scoped }
end
