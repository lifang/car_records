class CreateCarRecords < ActiveRecord::Migration
  def change
    create_table :car_records do |t|
      t.integer :car_type
      t.string  :user_name
      t.string :user_phone
      t.string  :buy_year
      t.string  :user_area
      t.timestamps
    end
  end
end
