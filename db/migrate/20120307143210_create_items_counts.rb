class CreateItemsCounts < ActiveRecord::Migration
  def change
    create_table :items_counts do |t|
      t.references :order
      t.references :item
      t.integer :count, :default => 1

      t.timestamps
    end
  end
end
