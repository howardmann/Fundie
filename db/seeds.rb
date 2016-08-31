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
samit = User.create :email => "samit@ga.co", :name => "samit", :password => 'chicken', :password_confirmation => 'chicken'
andrew = User.create :email => "andrew@ga.co", :name => "andrew", :password => 'chicken', :password_confirmation => 'chicken'
arpan = User.create :email => "arpan@ga.co", :name => "arpan", :password => 'chicken', :password_confirmation => 'chicken'
priyanka = User.create :email => "priyanka@ga.co", :name => "priyanka", :password => 'chicken', :password_confirmation => 'chicken'
yangmei = User.create :email => "yangmei@ga.co", :name => "yangmei", :password => 'chicken', :password_confirmation => 'chicken'
tom = User.create :email => "tom@ga.co", :name => "tom", :password => 'chicken', :password_confirmation => 'chicken'
steve = User.create :email => "steve@ga.co", :name => "steve", :password => 'chicken', :password_confirmation => 'chicken'
jong = User.create :email => "jong@ga.co", :name => "jong", :password => 'chicken', :password_confirmation => 'chicken'
lucas = User.create :email => "lucas@ga.co", :name => "lucas", :password => 'chicken', :password_confirmation => 'chicken'

puts "\nCreate User test"
p "User count: #{User.all.count}"
p "User emails : #{User.all.pluck(:email)}"
p "User names : #{User.all.pluck(:name)}"

##### PROJECT
Project.destroy_all
p1 = Project.create({
  :name => "CoffeeMe",
  :target_amount => 1000,
  :deadline => '01-09-2016',
  :image => 'coffee_me_shfmzh',
  :description => "Coffee cups for babies."
})
howie.projects << p1

p2 = Project.create({
  :name => "Keyboard",
  :target_amount => 5000,
  :deadline => '03-10-2016',
  :image => 'keyboard_g7posx',
  :description => "Electronic keyboard for animal sounds."
})
badger.projects << p2

p3 = Project.create({
  :name => "Speaker",
  :target_amount => 500,
  :deadline => '03-12-2016',
  :image => 'speaker_haggkf',
  :description => "Motivational speaking stool."
})
wolf.projects << p3

p4 = Project.create({
  :name => "Chariot",
  :target_amount => 6000,
  :deadline => '03-01-2017',
  :image => 'chariot_wki5uf',
  :description => "TV series where horses ride humans."
})
pete.projects << p4

p5 = Project.create({
  :name => "Fubar",
  :target_amount => 4000,
  :deadline => '07-06-2016',
  :image => 'fubar_rjzk8g',
  :description => "Hair salon which does the exact opposite of what you ask for."
})
howie.projects << p5

p6 = Project.create({
  :name => "Snaptop",
  :target_amount => 3000,
  :deadline => '03-07-2016',
  :image => 'snaptop_x1seov',
  :description => "Laptop which snaps shut randomly five times a day."
})
badger.projects << p6

p7 = Project.create({
  :name => "Burger",
  :target_amount => 4000,
  :deadline => '03-10-2016',
  :image => 'burger_txr4pj',
  :description => "I am hungry please fund my burger supply for a year."
})
badger.projects << p7

p8 = Project.create({
  :name => "Meth Lab",
  :target_amount => 10000,
  :deadline => '03-12-2016',
  :image => 'meth_lab_eea6vy',
  :description => "Please support me in my future career. Early backers will receive a 10% discount on the best Ice in town."
})
badger.projects << p8

p9 = Project.create({
  :name => "Mandarin Peeler",
  :target_amount => 5000,
  :deadline => '03-01-2017',
  :image => 'mandarin_peeler_gdftdb',
  :description => "Are you sick and tired of having to manually peel mandarins. With Mandarin Peeler, you can mail us your mandarins and we will ship them back peeled and tasty with a 7 day shipping guarantee."
})
pete.projects << p9

p10 = Project.create({
  :name => "Moustache Moistener",
  :target_amount => 7000,
  :deadline => '01-09-2016',
  :image => 'moustache_moistener_hqouqc',
  :description => "For the man who suffers from dry moustache syndrome."
})
wolf.projects << p10

puts "\nCreate Project test"
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
p "p7 project name: #{p7.name} belongs: to user #{p7.user.name}"
p "p8 project name: #{p8.name} belongs: to user #{p8.user.name}"
p "p9 project name: #{p9.name} belongs: to user #{p9.user.name}"
p "p10 project name: #{p10.name} belongs: to user #{p10.user.name}"

puts "\nAdd Deadline to Project test"
p "p1 deadline is #{p1.deadline.strftime("%a %d, %Y")}"
p "p2 deadline is #{p2.deadline.strftime("%a %d, %Y")}"
p "p3 deadline is #{p3.deadline.strftime("%a %d, %Y")}"
p "p4 deadline is #{p4.deadline.strftime("%a %d, %Y")}"
p "p5 deadline is #{p5.deadline.strftime("%a %d, %Y")}"
p "p6 deadline is #{p6.deadline.strftime("%a %d, %Y")}"
p "p7 deadline is #{p7.deadline.strftime("%a %d, %Y")}"

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
pledge5 = wolf.pledges.create({
  :amount => 500,
  :project_id => p7.id,
  :comment => "I support your burger dream"
})
pledge6 = andrew.pledges.create({
  :amount => 1000,
  :project_id => p8.id,
  :comment => "Go Heisenberg!"
})
pledge7 = priyanka.pledges.create({
  :amount => 3000,
  :project_id => p8.id,
  :comment => "Good for you"
})
pledge8 = yangmei.pledges.create({
  :amount => 4000,
  :project_id => p8.id,
  :comment => "So proud of you badger"
})

puts "\nCreate Pledges test"
p "Pledge count: #{Pledge.all.count}"
p "pledge1: #{pledge1.user.name} pledges $#{pledge1.amount.round} for project #{pledge1.project.name} by #{pledge1.project.user.name}"
p "pledge2: #{pledge2.user.name} pledges $#{pledge2.amount.round} for project #{pledge2.project.name} by #{pledge2.project.user.name}"
p "pledge3: #{pledge3.user.name} pledges $#{pledge3.amount.round} for project #{pledge3.project.name} by #{pledge3.project.user.name}"
p "pledge4: #{pledge4.user.name} pledges $#{pledge4.amount.round} for project #{pledge4.project.name} by #{pledge4.project.user.name}"
p "pledge5: #{pledge5.user.name} pledges $#{pledge5.amount.round} for project #{pledge5.project.name} by #{pledge5.project.user.name}"
p "pledge6: #{pledge6.user.name} pledges $#{pledge6.amount.round} for project #{pledge6.project.name} by #{pledge6.project.user.name}"
p "pledge7: #{pledge7.user.name} pledges $#{pledge7.amount.round} for project #{pledge7.project.name} by #{pledge7.project.user.name}"
p "pledge8: #{pledge8.user.name} pledges $#{pledge8.amount.round} for project #{pledge8.project.name} by #{pledge8.project.user.name}"

##### PROJECT PLEDGE TEST
puts "\nProject pledge vs target amount test"
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

puts "\nCategory create test"
p "Category count: #{Category.all.count}"
p "Category names include: #{Category.all.pluck(:name)}"

p1.categories << art << dance
p2.categories << art << film
p3.categories << publishing << film
p4.categories << theater << dance
p5.categories << film << food
p6.categories << dance << art << technology
p7.categories << food
p8.categories << food << fashion
p9.categories << food << theater
p10.categories << food << crafts

p "p1 categories include #{p1.categories.pluck(:name)}"
p "p2 categories include #{p2.categories.pluck(:name)}"
p "p3 categories include #{p3.categories.pluck(:name)}"
p "p4 categories include #{p4.categories.pluck(:name)}"
p "p5 categories include #{p5.categories.pluck(:name)}"
p "p6 categories include #{p6.categories.pluck(:name)}"
p "p7 categories include #{p7.categories.pluck(:name)}"
p "p8 categories include #{p8.categories.pluck(:name)}"
p "p9 categories include #{p9.categories.pluck(:name)}"
p "p10 categories include #{p10.categories.pluck(:name)}"

p "art projects include #{art.projects.pluck(:name)}"
p "dance projects include #{dance.projects.pluck(:name)}"
p "film projects include #{film.projects.pluck(:name)}"
