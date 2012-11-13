class AddSmallTypeToCarRecord < ActiveRecord::Migration
  def change
    add_column :car_records, :small_type, :string
  end
end
