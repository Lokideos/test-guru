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

users = User.create([{ email: 'bob@example.com', password: 'bob123',
                       confirmed_at: DateTime.now },
                     { email: 'alice@example.com', password: 'alice123',
                       confirmed_at: DateTime.now },
                     { email: 'test@test.com', password: '111111',
                       confirmed_at: DateTime.now },
                     { email: 'namedtest@test.com', password: '222222',
                       confirmed_at: DateTime.now, first_name: 'TestName',
                       last_name: 'TestLastName' },
                     { email: 'admintest@test.com', password: '222222',
                       confirmed_at: DateTime.now, first_name: 'AdminName',
                       last_name: 'AdminLastName', type: 'Admin' },
                     { email: 'dio@theworld.com', password: 'theworld',
                       confirmed_at: DateTime.now }])

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
                     { title: 'Unity Fundamentals', level: 3, category: categories[2],
                       author: users[2], timer: 50 },
                     { title: 'Unity Scripting', level: 3, category: categories[2],
                       author: users[2], timer: 100 },
                     { title: 'Unity Art', level: 3, category: categories[2],
                       author: users[2], timer: 2 }])

questions = Question.create([{ body: 'Ruby Metaprogramming question', test: tests[0] },
                             { body: 'Ruby Exceptions question', test: tests[0] },
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

Answer.create([{ body: 'Correct Answer to ruby Metaprogramming question',
                 question: questions[0],
                 correct: true },
               { body: '2nd Correct Answer to ruby Metaprogramming question',
                 question: questions[0],
                 correct: true },
               { body: '3rd Answer to ruby Metaprogramming question', question: questions[0] },
               { body: '4rd Answer to ruby Metaprogramming question', question: questions[0] },
               { body: 'Correct Answer to ruby Metaprogramming question', question:
                 questions[1],
                 correct: true },
               { body: '2nd Answer to ruby Metaprogramming question', question: questions[1] },
               { body: 'Answer to Rails assets pipeline question', question: questions[2] },
               { body: 'Answer to Node JS npm question', question: questions[3] },
               { body: 'Answer to Advanced Rails TDD/BDD question', question: questions[4] },
               { body: 'Answer to HTML & CSS tables formatting question', question: questions[5] },
               { body: 'Answer to HTML5 video question', question: questions[6] },
               { body: 'Answer to CSS3 flexbox grid question', question: questions[7] },
               { body: 'Answer to JS basics control flow question', question: questions[8] },
               { body: 'Answer to Unity project structure question', question: questions[9],
                 correct: true },
               { body: 'Answer to Unity reactive programming paradigm', question: questions[10],
                 correct: true },
               { body: 'Answer to Unity assets creation through 3dmax', question: questions[11],
                 correct: true }])

badge_acquisition_rules = BadgeAcquisitionRule.create([{ name: 'Test completed with first try',
                                                         acquisition_type: 'first_try',
                                                         acquisition_options: nil },
                                                       { name: "All tests of #{categories[2].title}
                                                                                        completed",
                                                         acquisition_type: 'category',
                                                         acquisition_options: categories[2].title },
                                                       { name: 'All tests of level 3 completed',
                                                         acquisition_type: 'level',
                                                         acquisition_options: 3 }])

Badge.create([{ name: '|Finish Category Badge|',
                icon_path: 'badge_icon.png',
                badge_acquisition_rule: badge_acquisition_rules[1] },
              { name: '|First try test badge|',
                icon_path: 'badge_icon.png',
                badge_acquisition_rule: badge_acquisition_rules[0] },
              { name: '|Finish level badge|',
                icon_path: 'badge_icon.png',
                badge_acquisition_rule: badge_acquisition_rules[2] }])
