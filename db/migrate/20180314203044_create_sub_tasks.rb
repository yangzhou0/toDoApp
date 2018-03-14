class CreateSubTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_tasks do |t|
      t.string :title
      t.text :body
      t.boolean :done, null: false, default: false
      t.integer :task_id, null: false

      t.timestamps
    end
  end
end
