class Task < ActiveRecord::Base
  belongs_to :project
=begin
  before_save :default_values
  def default_values
    self.is_completed ||= false
  end
=end
end