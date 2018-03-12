class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
