class AddCountToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :count, :integer
  end
end
