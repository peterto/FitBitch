# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {
    email: 'ankitaggarwal@gmail.com',
    password: 'ankita',
    phone_number: '+17328581134'
  },
  {
    email: 'sb1752@gmail.com',
    password: 'sb1752',
    phone_number: '+17329397743'
  },
  {
    email: 'pt9386@gmail.com',
    password: 'pt9386',
    phone_number: '+18608333149'
  }
])

Content.create(message: "You walked a whole STEPS feet? You'd totally escape life as a child soldier!")
Content.create(message: "You're a pathetic waste of space. You should have shot yourself STEPS feet ago.")
Content.create(message: "Yesterday you walked less feet than you were tall when they tried to abort you.")
Content.create(message: "Great job! Yesterday you walked STEPS feet below the national average!")

# Walk a lot of steps (Condescending Wonka)
Meme.create(
  subject: 'Good job! You walked STEPS steps below the national average',
  image_url: 'http://cdn.memegenerator.net/instances/400x/26423750.jpg'
)
# Forget to walk entirely (High Expectations Asian Father)
Meme.create(
  subject: 'Good job! You walked STEPS steps below the national average',
  image_url: 'http://cdn.memegenerator.net/instances/400x/26422674.jpg'
)
# Unsure of your exercise (Futurama Fry)
Meme.create(
  subject: "Exhausted after only STEPS steps?",
  image_url: 'http://cdn.memegenerator.net/instances/400x/26422045.jpg'
)
# Walk a lot of steps (Condescending Wonka)
# Meme.create(
#   subject: 'STEPS steps? Look at you go!',
#   image_url: 'http://cdn.memegenerator.net/instances/400x/26423104.jpg'
# )
# (South Park Ski Instructor)
# Meme.create(
#   subject: '',
#   image_url: 'http://cdn.memegenerator.net/instances/400x/26421761.jpg'
# )
