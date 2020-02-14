class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  attr_accessor :is_submitted

  def savable?
    @is_submitted && valid?
  end
end
