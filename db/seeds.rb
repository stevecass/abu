# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.create!(username:'admin', email:Faker::Internet.email, password:'pw123456')
30.times { User.create!(username: Faker::Internet.user_name, email:Faker::Internet.email, password:'pw123456') }
puts "Created users"
Category.create!(name:'General', display_order:10)
Category.create!(name:'Tech advice', display_order:20)
Category.create!(name:'Product guides', display_order:30)
Category.create!(name:'Miscellaneous', display_order:40)
cats = Category.all
users = User.all

alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
puts "Created categories"

12.times do
  print "."
  top = Topic.create!(name: "#{Faker::App.name} #{alphabet.sample} #{Faker::App.name}", category: cats.sample)
  16.times do
    print "+"
    thr = Conversation.create!(name:Faker::Commerce.product_name, topic:top, author:users.sample )
    Random.rand(120).times do
      msg = Message.create!(user:users.sample, conversation:thr, content:Faker::Lorem.paragraphs(3).join("\n"))
    end
  end
  puts

end
