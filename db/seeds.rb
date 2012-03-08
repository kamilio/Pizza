# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.create([:login => 'kamil', :password => 'kamil', :password_confirmation => 'kamil',:email => 'kamil@kamil.sk', :name => "Kamil Jopek", :address => "Komenskeho 2\n92101 Piestany\nSlovakia"])
