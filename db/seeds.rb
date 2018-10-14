# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Bob', role: 'admin' },
                     { name: 'Alice', role: 'basic_user' },
                     { name: 'Dio', role: 'moderator' }])

categories = Category.create([{ title: 'Backend web development' },
                              { title: 'Frontend web development' },
                              { title: 'Game development' }])

tests = Test.create([{ title: 'Ruby', level: 0, category: categories[0], author: users[0] },
                     { title: 'Rails', level: 1, category: categories[0], author: users[0] },
                     { title: 'Node JS', level: 1, category: categories[0], author: users[0] },
                     { title: 'Advanced Rails', level: 2, category: categories[0],
                       author: users[1] },
                     { title: 'HTML & CSS', level: 0, category: categories[1], author: users[1] },
                     { title: 'HTML5', level: 0, category: categories[1], author: users[1] },
                     { title: 'CSS3', level: 1, category: categories[1], author: users[1] },
                     { title: 'JS basics', level: 1, category: categories[1],
                       author: users[2] },
                     { title: 'Unity Fundamentals', level: 0, category: categories[2],
                       author: users[2] },
                     { title: 'Unity Scripting', level: 1, category: categories[2],
                       author: users[2] },
                     { title: 'Unity Art', level: 1, category: categories[2], author: users[2] }])

questions = Question.create([{ body: 'Ruby Metaprogramming question', test: tests[0] },
                             { body: 'Rails assets pipeline question', test: tests[1] },
                             { body: 'Node JS npm question', test: tests[2] },
                             { body: 'Advanced Rails TDD/BDD question', test: tests[3] },
                             { body: 'HTML & CSS tables formatting question', test: tests[4] },
                             { body: 'HTML5 video question', test: tests[5] },
                             { body: 'CSS3 flexbox grid question', test: tests[6] },
                             { body: 'JS basics control flow question', test: tests[7] },
                             { body: 'Unity project structure question', test: tests[8] },
                             { body: 'Unity reactive programming paradigm', test: tests[9] },
                             { body: 'Unity assets creation through 3dmax', test: tests[10] }])

Answer.create([{ body: 'Answer to ruby Metaprogramming question', question: questions[0] },
               { body: 'Answer to Rails assets pipeline question', question: questions[1] },
               { body: 'Answer to Node JS npm question', question: questions[2] },
               { body: 'Answer to Advanced Rails TDD/BDD question', question: questions[3] },
               { body: 'Answer to HTML & CSS tables formatting question', question: questions[4] },
               { body: 'Answer to HTML5 video question', question: questions[5] },
               { body: 'Answer to CSS3 flexbox grid question', question: questions[6] },
               { body: 'Answer to JS basics control flow question', question: questions[7] },
               { body: 'Answer to Unity project structure question', question: questions[8] },
               { body: 'Answer to Unity reactive programming paradigm', question: questions[9] },
               { body: 'Answer to Unity assets creation through 3dmax', question: questions[10] }])

TestProgress.create([{ test: tests[0], user: users[0], finished: true },
                     { test: tests[1], user: users[0], finished: true },
                     { test: tests[2], user: users[0], finished: true },
                     { test: tests[0], user: users[1] },
                     { test: tests[8], user: users[2] }])
