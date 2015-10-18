# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.create!(username:'admin', email:Faker::Internet.email, password:'pw123456')
Category.create!(name:'General', display_order:10)
Category.create!(name:'Tech advice', display_order:20)
Category.create!(name:'Product guides', display_order:30)
Category.create!(name:'Miscellaneous', display_order:40)
cats = Category.all

12.times do
  top = Topic.create!(name: Faker::Company.catch_phrase, category: cats.sample)
  6.times do
    thr = Conversation.create!(name:Faker::Commerce.product_name, topic:top, author:u )
    Random.rand(20).times do
      msg = Message.create!(user:u, conversation:thr, content:Faker::Lorem.sentence)
    end
  end
end