class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
