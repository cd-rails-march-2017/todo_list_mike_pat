class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :item
      t.date :due_date
      t.references :user, index: true, foreign_key: true
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
