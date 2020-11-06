class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.integer    :user_id, null: false
      t.string    :family_name, null: false
      t.string    :first_name
      t.string    :family_name_kana
      t.string    :first_name_kana
      t.integer   :sex_id
      t.date      :age
      t.string    :company
      t.string    :position
      t.string     :postal_code, null: false
      t.string     :address1, null: false
      t.string     :address2,   null: false
      t.string     :address3,   null: false
      t.string     :building_name
      t.string     :phone_number
      t.timestamps
    end
  end
end
