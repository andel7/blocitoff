# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.skip_confirmation!
 admin.save!


  list = List.create!(
    user:   admin,
    title:  Faker::Lorem.sentence
  )

#Create Comments
10.times do
  Item.create!(
    # user: users.sample,   # we have not yet associated Users with Comments
    list: list,
    name: Faker::Lorem.paragraph
  )
end
