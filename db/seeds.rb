# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require "open-uri"
# file = URI.parse("https://static01.nyt.com/images/2020/12/20/multimedia/20ah-knitting/20ah-knitting-superJumbo.jpg?quality=75&auto=webp").open
# photo = URI.parse("https://images.unsplash.com/photo-1584992236310-6edddc08acff?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a25pdHRpbmd8ZW58MHx8MHx8fDA%3D").open

# puts "Cleaning database..."
# Task.destroy_all
# Message.destroy_all
# ProjectYarn.destroy_all
# Chat.destroy_all
# Project.destroy_all
# User.destroy_all


# Yarn.destroy_all


#  User.create!(email: "test@test.com", password: "123456", first_name: "Adrian")
#  User.create!(email: "test1@test.com", password: "123456", first_name: "Adrian1")

#  all_users = User.all
#  all_users.each do |user|
#    myproject = Project.create!(user: user, title: "my project", designer: "everything", category: "sweather", needle_size: 2.4, product_size: "small", difficulty: "hard", status: "done" )
#    myproject.images.attach(io: file, filename: "nes.png", content_type: "image/png")
#    myproject.images.attach(io: photo, filename: "nes.png", content_type: "image/png")
#    myproject.save
#    yourproject=Project.create!(user: user, title: "caschmere project", designer: "Idk", category: "socks", needle_size: 4.3, product_size: "xl", difficulty: "easy", status: "ongoing")
#   yourproject.images.attach(io: file, filename: "nes.png", content_type: "image/png")
#   yourproject.images.attach(io: photo, filename: "nes.png", content_type: "image/png")
#   yourproject.save
#  end

#  all_projects = Project.all
#  all_projects.each do |project|
#    Task.create!(project: project, description: "jsdsdiwjidjde", title: "back")
#    Task.create!(project: project, description: "snfeneneff", title: "let s do the shoulders")
#  end

Yarn.create!(material: "wool")
Yarn.create!(material: "cotton")
Yarn.create!(material: "merino wool")
Yarn.create!(material: "alpaca")
Yarn.create!(material: "mohair")
Yarn.create!(material: "cashmere")
Yarn.create!(material: "angora")
Yarn.create!(material: "silk")
Yarn.create!(material: "linen")
Yarn.create!(material: "bamboo")
Yarn.create!(material: "viscose")
Yarn.create!(material: "acrylic")
Yarn.create!(material: "polyamide")
Yarn.create!(material: "polyester")
Yarn.create!(material: "spandex")



#  all_yarns = Yarn.all
#  all_projects.each do |project|
#   all_yarns.each do |yarn|
#     ProjectYarn.create!(yarn: yarn, project: project, amount: 2 )
#     ProjectYarn.create!(yarn: yarn, project: project, amount: 4 )
#   end
# end

# all_users.each do |user|
#   Chat.create!(user: user)
#   Chat.create!(user: user)
# end

# all_chats = Chat.all
# all_chats.each do |chat|
#   Message.create!(chat: chat, content: "ndsiiefbfehe", role: "user")
#   Message.create!(chat: chat, content: "ndssieni2332e", role: "assistant")
#   Message.create!(chat: chat, content: "ndssieni2332e", role: "user")
# end
