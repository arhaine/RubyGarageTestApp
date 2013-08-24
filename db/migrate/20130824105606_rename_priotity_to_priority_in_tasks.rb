class RenamePriotityToPriorityInTasks < ActiveRecord::Migration
  def change
    rename_column(:tasks, :priotity, :priority)
  end
end
