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

test1 = Test.create(title: 'HTML').categories << category1
test2 = Test.create(title: 'JavaScript', level: 1).canegories << category1
test3 = Test.create(title: 'Ruby', level: 2).canegories << category2
test4 = Test.create(title: 'Java', level: 3).canegories << category2
test5 = Test.create(title: 'Python', level: 2).canegories << category3

question1 = Question.create(body: 'What is a class?').tests << test3
question2 = Question.create(body: 'What is an object?').tests << test3
question3 = Question.create(body: 'How would you declare and use a constructor in Ruby?').tests << test3
question4 = Question.create(body: 'What are tags?').tests << test1
question5 = Question.create(body: 'What is HTML?').tests << test1
question6 = Question.create(body: 'What is JavaScript?').tests << test2
question7 = Question.create(body: 'What are JavaScript Data Types?').tests << test2
question8 = Question.create(body: 'What is the core Java?').tests << test4
question9 = Question.create(body: 'Is python a case sensitive language?').tests << test5

answer1 = Answer.create(body: 'A class is a blueprint from which objects are created.').questions << question1
answer2 = Answer.create(body: 'The object is also called as an instance of a class.').questions << question2
answer3 = Answer.create(body: 'Constructors are used to initialize the instance variables.').questions << question3
answer4 = Answer.create(body: 'A set of characters constituting a formatted command for a Web page').questions << question4
answer5 = Answer.create(body: 'Hypertext Markup Language').questions << question5
answer6 = Answer.create(body: 'JavaScript is a client-side as well as server side scripting language').questions << question6
answer7 = Answer.create(body: 'Number, String, Undefined, Boolean, Object').questions << question7
answer8 = Answer.create(body: 'Core java is used to developing the application of java.').questions << question8
answer9 = Answer.create(body: 'Yes! Python is a case sensitive programming language.').questions << question9

User.create([{name: 'Bom'}, {name: 'Bim'}])
