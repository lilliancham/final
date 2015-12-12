names = ["Meredith", "Cristina", "Derek", "Miranda", "Alex"]

names.each do |name|
  user = User.create
  user.name = name
  user.email = "#{name}@example.com"
  user.password = "12341234"
  user.save
end

puts "There are now #{User.count} users in the database."

event_info = [
  {
    :image => "http://www.aroundthetownchicago.com/wp-content/uploads/2012/02/UP_Club_Interior_001.jpg",
    :held_on => 'November 1st 2015 21:00:00 PM',
    :description => "Come enjoy a show at Second City!",
    :capacity => 20,
    :title => "Show at Second City!",
    :location => "Second City Theater"
},
{
    :image => "http://41.media.tumblr.com/efac1b9c7b8c88b8a19886ee594ea100/tumblr_mgtya7vTKF1rhpd0ao1_1280.jpg",
    :held_on => 'January 4th 2016 13:00:00 PM',
    :description => "Come elebrate my birthday with me!",
    :capacity => 4,
    :title => "Birthday Lunch!",
    :location => "Pump Room"
},
{
    :image => "http://fantasyrundown.com/wp-content/uploads/2014/04/Soldier-Field-destination360.com_1.jpg",
    :held_on => 'January 24th 2016 14:00:00 PM',
    :description => "Cheer on the Bears!",
    :capacity => 6,
    :title => "Bears Game!",
    :location => "Soldier Field"
},
{
    :image => "http://www.lpzoo.org/sites/default/files/images/events/zlpromo_southlawn670.jpg",
    :held_on => 'December 28th 2015 11:00:00 AM',
    :description => "Celebrate the holidays!",
    :capacity => 30,
    :title => "Zoolights at Lincoln Park Zoo",
    :location => "Lincoln Park Zoo"
},
{
    :image => "https://www.gatewayticketing.com/Portals/0/Images/Press%20Releases/AIC-Facade-North-View.jpg",
    :held_on => 'November 10th 2015 11:00:00 AM',
    :description => "Learn about Van Gough and other artists",
    :capacity => 4,
    :title => "Tour of Art Institute",
    :location => "Art Institute"
}
]

users = User.all

users.each do |user|
  user.events.create event_info
end

puts "There are now #{Event.count} events in the database."

events = Event.all


events.each do |event|
  rand(6).times do
    comment = event.comments.build
    comment.user = users.sample
    comment.body = Faker::Hacker.say_something_smart
    comment.save
  end
end

puts "There are now #{Comment.count} comments in the database."

events.each do |event|
    users.sample(rand(users.count)).each do |user|
    signup = event.signups.build
    signup.user = user
    signup.save
  end
end

puts "There are now #{Signup.count} signups in the database."
