class CreateItemsCounts < ActiveRecord::Migration
  def change
    create_table :items_counts do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :count, :default => 1

      t.timestamps
    end
  end
end
