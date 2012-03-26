# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
      #abort current_user.has_role?("stuff")
      primary.item :tracking, 'Order tracking', tracking_index_path if can? :create, Order
      primary.item :items, 'Items', items_path if can? :destroy, Order
      primary.item :stuff, "Stuff", stuff_index_path if can? :destroy, Order
      primary.item :delivery, "Delivery", delivery_index_path if can? :destroy, Order
  end
end
