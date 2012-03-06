class Order < ActiveRecord::Base
  has_many_belongs_to_many :items
end
