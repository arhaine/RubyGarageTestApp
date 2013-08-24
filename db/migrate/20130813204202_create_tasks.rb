class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :project_id
      t.integer :priotity
      t.boolean :is_completed
      t.datetime :deadline

      t.timestamps
    end
  end
end
