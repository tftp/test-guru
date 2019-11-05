# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category1 = Category.create(title: 'Frontend')
category2 = Category.create(title: 'Backend')
category3 = Category.create(title: 'Machine Learning')

user1 = User.create(name: 'Bom')
user2 = User.create(name: 'Bim')

test1 = category1.tests.create(title: 'HTML')
test2 = category1.tests.create(title: 'JavaScript', level: 1)
test3 = category2.tests.create(title: 'Ruby', level: 2)
test4 = category2.tests.create(title: 'Java', level: 3)
test5 = category3.tests.create(title: 'Python', level: 2)

question1 = test3.questions.create(body: 'What is a class?')
question2 = test3.questions.create(body: 'What is an object?')
question3 = test3.questions.create(body: 'How would you declare and use a constructor in Ruby?')
question4 = test1.questions.create(body: 'What are tags?')
question5 = test1.questions.create(body: 'What is HTML?')
question6 = test2.questions.create(body: 'What is JavaScript?')
question7 = test2.questions.create(body: 'What are JavaScript Data Types?')
question8 = test4.questions.create(body: 'What is the core Java?')
question9 = test5.questions.create(body: 'Is python a case sensitive language?')

answer1 = question1.answers.create(body: 'A class is a blueprint from which objects are created.')
answer2 = question2.answers.create(body: 'The object is also called as an instance of a class.')
answer3 = question3.answers.create(body: 'Constructors are used to initialize the instance variables.')
answer4 = question4.answers.create(body: 'A set of characters constituting a formatted command for a Web page')
answer5 = question5.answers.create(body: 'Hypertext Markup Language')
answer6 = question6.answers.create(body: 'JavaScript is a client-side as well as server side scripting language')
answer7 = question7.answers.create(body: 'Number, String, Undefined, Boolean, Object')
answer8 = question8.answers.create(body: 'Core java is used to developing the application of java.')
answer9 = question9.answers.create(body: 'Yes! Python is a case sensitive programming language.')
