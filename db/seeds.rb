# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

user = User.build([:login => 'admin', :password => 'admin', :password_confirmation => 'admin',:email => 'kamil@kamil.sk', :name => "Kamil Jopek", :address => "Komenskeho 2\n92101 Piestany\nSlovakia"])
user.add_role "admin"
user.save

user = User.build([:login => 'stuff', :password => 'stuff', :password_confirmation => 'stuff',:email => 'kamil1@kamil.sk', :name => "Kamil Jopek", :address => "Komenskeho 2\n92101 Piestany\nSlovakia"])
user.add_role "stuff"
user.save

user = User.build([:login => 'guest', :password => 'guest', :password_confirmation => 'guest',:email => 'kamil2@kamil.sk', :name => "Kamil Jopek", :address => "Komenskeho 2\n92101 Piestany\nSlovakia"])
user.add_role "registered"
user.save
