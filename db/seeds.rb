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

Test.create([{ title: 'Ruby', level: 0, category_id: 1 },
             { title: 'Rails', level: 1, category_id: 1 },
             { title: 'Node JS', level: 1, category_id: 1 },
             { title: 'Advanced Rails', level: 2, category_id: 1 },
             { title: 'HTML & CSS', level: 0, category_id: 2 },
             { title: 'HTML5', level: 0, category_id: 2 },
             { title: 'CSS3', level: 1, category_id: 2 },
             { title: 'JS basics', level: 1, category_id: 2 },
             { title: 'Unity Fundamentals', level: 0, category_id: 3 },
             { title: 'Unity Scripting', level: 1, category_id: 3 },
             { title: 'Unity Art', level: 1, category_id: 3 }])

Category.create([{ title: 'Backend web development' },
                 { title: 'Frontend web development' },
                 { title: 'Game development' }])

Question.create([{ body: 'Ruby Metaprogramming question', test_id: 1 },
                 { body: 'Rails assets pipeline question', test_id: 2 },
                 { body: 'Node JS npm question', test_id: 3 },
                 { body: 'Advanced Rails TDD/BDD question', test_id: 4 },
                 { body: 'HTML & CSS tables formatting question', test_id: 5 },
                 { body: 'HTML5 video question', test_id: 6 },
                 { body: 'CSS3 flexbox grid question', test_id: 7 },
                 { body: 'JS basics control flow question', test_id: 8 },
                 { body: 'Unity project structure question', test_id: 9 },
                 { body: 'Unity reactive programming paradigm', test_id: 10 },
                 { body: 'Unity assets creation through 3dmax', test_id: 11 }])

Answer.create([{ body: 'Answer to ruby Metaprogramming question', question_id: 1 },
               { body: 'Answer to Rails assets pipeline question', question_id: 2 },
               { body: 'Answer to Node JS npm question', question_id: 2 },
               { body: 'Answer to Advanced Rails TDD/BDD question', question_id: 2 },
               { body: 'Answer to HTML & CSS tables formatting question', question_id: 2 },
               { body: 'Answer to HTML5 video question', question_id: 2 },
               { body: 'Answer to CSS3 flexbox grid question', question_id: 2 },
               { body: 'Answer to JS basics control flow question', question_id: 2 },
               { body: 'Answer to Unity project structure question', question_id: 2 },
               { body: 'Answer to Unity reactive programming paradigm', question_id: 2 },
               { body: 'Answer to Unity assets creation through 3dmax', question_id: 2 }])

User.create([{ name: 'Bob', role: 'admin' },
             { name: 'Alice', role: 'basic_user' },
             { name: 'Dio', role: 'moderator' }])
