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

Content.create(message: "This is a message")
Content.create(message: "You suck man")
Content.create(message: "Your momma so fat, she jumped up in the air and got suck.")
Content.create(message: "KEYWORD steps? You're a fat person.")
Content.create(message: "Only KEYWORD. Congratulations, you made the world fatter.")
Content.create(message: "Thanks fatty.")
