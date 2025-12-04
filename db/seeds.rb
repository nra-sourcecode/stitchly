# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg").open

puts "Cleaning database..."
Task.destroy_all
Message.destroy_all
ProjectYarn.destroy_all
Chat.destroy_all
Project.destroy_all
User.destroy_all


Yarn.destroy_all


 User.create!(email: "test@test.com", password: "123456")
 User.create!(email: "test1@test.com", password: "123456")

 all_users = User.all
 all_users.each do |user|
   myproject = Project.create!(user: user, title: "my project", designer: "everithing", category: "sweather", needle_size: 2, product_size: "small", difficulty: "hard" )
   myproject.images.attach(io: file, filename: "nes.png", content_type: "image/png")
   myproject.save
   yourproject=Project.create!(user: user, title: "caschmere project", designer: "Idk", category: "socks", needle_size: 4, product_size: "xl", difficulty: "easy")
  yourproject.images.attach(io: file, filename: "nes.png", content_type: "image/png")
  yourproject.save
 end

 all_projects = Project.all
 all_projects.each do |project|
   Task.create!(project: project, comment: "jsdsdiwjidjde")
   Task.create!(project: project, comment: "snfeneneff")
 end

Yarn.create!(material: "case")
Yarn.create!(material: "cotton")

 all_yarns = Yarn.all
 all_projects.each do |project|
  all_yarns.each do |yarn|
    ProjectYarn.create!(yarn: yarn, project: project, amount: 2 )
    ProjectYarn.create!(yarn: yarn, project: project, amount: 4 )
  end
end

all_users.each do |user|
  Chat.create!(user: user)
  Chat.create!(user: user)
end

all_chats = Chat.all
all_chats.each do |chat|
  Message.create!(chat: chat, content: "ndsiiefbfehe", role: "user")
  Message.create!(chat: chat, content: "ndssieni2332e", role: "user")
end
