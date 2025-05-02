class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :status
      t.string :created_user
      t.string :update_user

      t.timestamps
    end
  end
end
