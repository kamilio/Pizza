# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    if current_user
      primary.item :menu, 'Menu', root_path
      primary.item :items, 'Items', items_path
      primary.item :stuff, "Stuff", stuff_index_path
      primary.item :delivery, "Delivery", delivery_index_path
    end
  end

end
