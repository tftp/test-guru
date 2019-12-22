# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TestPassage.delete_all
Gist.delete_all
User.delete_all
Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all
Picture.delete_all
Rule.delete_all

user1 = User.create(name: 'OS', email: 'sergeichforever@inbox.ru', password: 'qwerty')

Picture.create(url: 'b1.png')
Picture.create(url: 'b2.png')
Picture.create(url: 'b3.png')
Picture.create(url: 'b4.png')

Rule.create(command: "rule_for_test_success", body: "Успешное прохождение теста с первой попытки")
Rule.create(command: "rule_for_tests_success_of_category", body: "Успешное прохождение всех тестов категории")
Rule.create(command: "rule_for_tests_success_of_level", body: "Успешное прохождение всех тестов уровня")

category1 = Category.create(title: 'Frontend')
category2 = Category.create(title: 'Backend')
category3 = Category.create(title: 'Machine Learning')

test1 = category1.tests.create(title: 'HTML', author: user1)
test2 = category1.tests.create(title: 'JavaScript', level: 1, author: user1)
test3 = category2.tests.create(title: 'Ruby', level: 2, author: user1)
test4 = category2.tests.create(title: 'Java', level: 3, author: user1)
test5 = category3.tests.create(title: 'Python', level: 2, author: user1)

question1 = test3.questions.create(body: 'What is a class?')
question2 = test3.questions.create(body: 'What is an object?')
question3 = test3.questions.create(body: 'How would you declare and use a constructor in Ruby?')
question4 = test1.questions.create(body: 'What are tags?')
question5 = test1.questions.create(body: 'What is HTML?')
question6 = test2.questions.create(body: 'What is JavaScript?')
question7 = test2.questions.create(body: 'What are JavaScript Data Types?')
question8 = test4.questions.create(body: 'What is the core Java?')
question9 = test5.questions.create(body: 'Is python a case sensitive language?')

answer1 = question1.answers.create(body: 'A class is a blueprint from which objects are created.', correct: true)
answer2 = question2.answers.create(body: 'The object is also called as an instance of a class.', correct: true)
answer3 = question3.answers.create(body: 'Constructors are used to initialize the instance variables.', correct: true)
answer4 = question4.answers.create(body: 'A set of characters constituting a formatted command for a Web page', correct: true)
answer5 = question5.answers.create(body: 'Hypertext Markup Language', correct: true)
answer6 = question6.answers.create(body: 'JavaScript is a client-side as well as server side scripting language', correct: true)
answer7 = question7.answers.create(body: 'Number, String, Undefined, Boolean, Object', correct: true)
answer8 = question8.answers.create(body: 'Core java is used to developing the application of java.', correct: true)
answer9 = question9.answers.create(body: 'Yes! Python is a case sensitive programming language.', correct: true)
