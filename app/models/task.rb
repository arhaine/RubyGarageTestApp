class Task < ActiveRecord::Base
  belongs_to :project
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :project, presence: true
  validates :priority, :inclusion => { :in => 0..9 }
=begin
  before_save :default_values
  def default_values
    self.is_completed ||= false
  end
=end

  def is_completed?
    is_completed
  end

  def change_state
    self.update_attributes is_completed: (is_completed? ?  false : true )
  end

end