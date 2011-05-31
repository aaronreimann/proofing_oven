class Filter
  attr_accessor :criteria, :klass

  def initialize(klass, criteria={})
    self.klass = klass.to_s.capitalize.constantize
    self.criteria = criteria
  end

  def display_all?
    return true unless criteria.present?
    status.blank? || status == "Display All"
  end

  def refine
    return klass.scoped if display_all?
    criteria.inject(klass.scoped) do |model, (ky, val)|
      model.send(ky, val)
    end
  end

  def status
    has_status? ? criteria[:status] : "Display All"
  end

  private
  def has_status?
    criteria.present? && criteria.has_key?(:status)
  end
end
