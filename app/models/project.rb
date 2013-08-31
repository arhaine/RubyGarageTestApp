class Project < ActiveRecord::Base
  before_destroy :destroy_tasks
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  belongs_to :user
  has_many :tasks

  private
    def destroy_tasks
      Task.delete_all project_id: id
    end
end
