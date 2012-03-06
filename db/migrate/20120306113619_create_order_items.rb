class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items, :id => false do |t|
      t.integer :item_id
      t.integer :order_id

      t.timestamps
    end
  end
end
