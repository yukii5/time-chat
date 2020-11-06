class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.string :title
      t.text :content
      t.datetime :start_time
      t.datetime :last_time
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
