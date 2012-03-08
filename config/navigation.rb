# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :menu, 'Menu', root_path
    primary.item :items, 'Items', items_path
    primary.item :users, 'Users', users_path
  end

end
