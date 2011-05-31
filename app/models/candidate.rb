class Candidate < ActiveRecord::Base
  STATUSES = ["pending", "hired", "rejected"]

  scope :filter, lambda { |params|
    where(status: params[:status])
  }

  scope :status, lambda { |value|
    where(status: value)
  }

  def full_name
    [first_name, last_name].join(" ")
  end
end
