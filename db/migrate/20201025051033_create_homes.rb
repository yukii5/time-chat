class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.references :@search

      t.timestamps
    end
  end
end
