# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##### USER
User.destroy_all
howie = User.create :email => "howie@ga.co", :name => "howie", :password => 'chicken', :password_confirmation => 'chicken'

badger = User.create :email => "badger@ga.co", :name => "badger", :password => 'chicken', :password_confirmation => 'chicken'

wolf = User.create :email => "wolf@ga.co", :name => "wolf", :password => 'chicken', :password_confirmation => 'chicken'

pete = User.create :email => "pete@ga.co", :name => "pete", :password => 'chicken', :password_confirmation => 'chicken'

puts Rainbow("\nCreate User test").ljust(60,'.').red
p "User count: #{User.all.count}"
p "User emails : #{User.all.pluck(:email)}"
p "Howie password is: #{howie.password_digest}"

##### PROJECT
Project.destroy_all
p1 = Project.create({
  :name => "CoffeeMe",
  :target_amount => 1000,
  :description => "Coffee cups for babies"
})
howie.projects << p1

p2 = Project.create({
  :name => "Keyboard",
  :target_amount => 5000,
  :description => "Electronic keyboard for animal sounds"
})
badger.projects << p2

p3 = Project.create({
  :name => "Speaker",
  :target_amount => 500,
  :description => "Motivational speaking stool"
})
wolf.projects << p3

p4 = Project.create({
  :name => "Chariot",
  :target_amount => 6000,
  :description => "TV series where horses ride humans"
})
pete.projects << p4

p5 = Project.create({
  :name => "Fubar",
  :target_amount => 4000,
  :description => "Hair salon which does the exact opposite of what you ask for"
})
howie.projects << p5

p6 = Project.create({
  :name => "Snaptop",
  :target_amount => 3000,
  :description => "Laptop which snaps shut randomly five times a day"
})
badger.projects << p6

puts Rainbow("\nCreate Project test").ljust(60,'.').green
p "Project count: #{Project.all.count}"
p "Project names: #{Project.all.pluck(:name)}"
p "Howie's projects: #{howie.projects.all.pluck(:name)}"
p "Badger's projects: #{badger.projects.all.pluck(:name)}"
p "Wolf's projects: #{wolf.projects.all.pluck(:name)}"
p "Pete's projects: #{pete.projects.all.pluck(:name)}"
p "p1 project name: #{p1.name} belongs: to user #{p1.user.name}"
p "p2 project name: #{p2.name} belongs: to user #{p2.user.name}"
p "p3 project name: #{p3.name} belongs: to user #{p3.user.name}"
p "p4 project name: #{p4.name} belongs: to user #{p4.user.name}"
p "p5 project name: #{p5.name} belongs: to user #{p5.user.name}"
p "p6 project name: #{p6.name} belongs: to user #{p6.user.name}"

##### PLEDGE
Pledge.destroy_all
pledge1 = howie.pledges.create({
  :amount => 100,
  :project_id => p2.id,
  :comment => "Go Keyboard badger"
})
pledge2 = howie.pledges.create({
  :amount => 200,
  :project_id => p3.id,
  :comment => "I love speakers wolf"
})
pledge3 = wolf.pledges.create({
  :amount => 500,
  :project_id => p2.id,
  :comment => "I love keyboards too"
})
pledge4 = badger.pledges.create({
  :amount => 400,
  :project_id => p3.id,
  :comment => "I love speaker stools"
})

puts Rainbow("\nCreate Pledges test").ljust(60,'.').hotpink
p "Pledge count: #{Pledge.all.count}"
p "pledge1: #{pledge1.user.name} pledges $#{pledge1.amount.round} for project #{pledge1.project.name} by #{pledge1.project.user.name}"
p "pledge2: #{pledge2.user.name} pledges $#{pledge2.amount.round} for project #{pledge2.project.name} by #{pledge2.project.user.name}"
p "pledge3: #{pledge3.user.name} pledges $#{pledge3.amount.round} for project #{pledge3.project.name} by #{pledge3.project.user.name}"
p "pledge4: #{pledge4.user.name} pledges $#{pledge4.amount.round} for project #{pledge4.project.name} by #{pledge4.project.user.name}"

##### PROJECT PLEDGE TEST
puts Rainbow("\nProject pledge vs target amount test").ljust(60,'.').yellow
p "Project 1: #{p2.name} total pledged: #{p1.pledges.sum(:amount)} vs. target of #{p1.target_amount}"
p "Project 2: #{p2.name} total pledged: #{p2.pledges.sum(:amount)} vs. target of #{p2.target_amount}"
p "Project 3: #{p3.name} total pledged: #{p3.pledges.sum(:amount)} vs. target of #{p3.target_amount}"

##### CATEGORY CREATE TEST
Category.destroy_all
art = Category.create :name => "art"
comics = Category.create :name => "comics"
crafts = Category.create :name => "crafts"
dance = Category.create :name => "dance"
design = Category.create :name => "design"
fashion = Category.create :name => "fashion"
film = Category.create :name => "film"
food = Category.create :name => "food"
games = Category.create :name => "games"
journalism = Category.create :name => "journalism"
music = Category.create :name => "music"
photography = Category.create :name => "photography"
publishing = Category.create :name => "publishing"
technology = Category.create :name => "technology"
theater = Category.create :name => "theatre"
other = Category.create :name => "other"

puts Rainbow("\nCategory create test").ljust(60,'.').orange
p "Category count: #{Category.all.count}"
p "Category names include: #{Category.all.pluck(:name)}"

p1.categories << art << dance
p2.categories << art << film
p3.categories << publishing << film
p4.categories << theater << dance
p5.categories << film << food
p6.categories << dance << art << technology

p "p1 categories include #{p1.categories.pluck(:name)}"
p "p2 categories include #{p2.categories.pluck(:name)}"
p "p3 categories include #{p3.categories.pluck(:name)}"
p "p4 categories include #{p4.categories.pluck(:name)}"
p "p5 categories include #{p5.categories.pluck(:name)}"
p "p6 categories include #{p6.categories.pluck(:name)}"

p "art projects include #{art.projects.pluck(:name)}"
p "dance projects include #{dance.projects.pluck(:name)}"
p "film projects include #{film.projects.pluck(:name)}"
