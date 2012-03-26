class CreateOrderHistories < ActiveRecord::Migration
  def change
    create_table :order_histories do |t|
      t.integer :order_id
      t.integer :user_id
      t.string :transition
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
