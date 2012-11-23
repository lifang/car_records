class AddDetialToCarRecords < ActiveRecord::Migration
  def change
    add_column :car_records, :car_num, :string
    add_column :car_records, :birthday, :string
    add_column :car_records, :email, :string
  end
end
