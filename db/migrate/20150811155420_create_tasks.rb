class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :body
      t.string :status, default: 'incomplete'
      t.date :due_date
      t.timestamps null: false
    end
  end
end
