# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
                 {title: 'Frontend'},
                 {title: 'Backend'},
                 {title: 'Machine Learning'}
  ])
Test.create([
                 {title: 'HTML', categories_id: 1},
                 {title: 'JavaScript', level: 1, categories_id: 1},
                 {title: 'Ruby', level: 2, categories_id: 2},
                 {title: 'Java', level: 3, categories_id: 2},
                 {title: 'Python', level: 2, categories_id: 3}
  ])
Question.create([
                 {body: 'What is a class?', tests_id: 3},
                 {body: 'What is an object?', tests_id: 3},
                 {body: 'How would you declare and use a constructor in Ruby?', tests_id: 3},
                 {body: 'What are tags?', tests_id: 1},
                 {body: 'What is HTML?', tests_id: 1},
                 {body: 'What is JavaScript?', tests_id: 2},
                 {body: 'What are JavaScript Data Types?', tests_id: 2},
                 {body: 'What is the core Java?', tests_id: 4},
                 {body: 'Is python a case sensitive language?', tests_id: 5}
  ])
Answer.create([
                 {body: 'A class is a blueprint from which objects are created.', questions_id: 1},
                 {body: 'The object is also called as an instance of a class.', questions_id: 2},
                 {body: 'Constructors are used to initialize the instance variables.', questions_id: 3},
                 {body: 'A set of characters constituting a formatted command for a Web page', questions_id: 4},
                 {body: 'Hypertext Markup Language', questions_id: 5},
                 {body: 'JavaScript is a client-side as well as server side scripting language', questions_id: 6},
                 {body: 'Number, String, Undefined, Boolean, Object', questions_id: 7},
                 {body: 'Core java is used to developing the application of java.', questions_id: 8},
                 {body: 'Yes! Python is a case sensitive programming language.', questions_id: 9}
  ])
