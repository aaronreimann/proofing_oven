class Candidate < ActiveRecord::Base
  STATUSES = ["pending", "hired", "rejected"]

  def full_name
    [first_name, last_name].join(" ")
  end
end
