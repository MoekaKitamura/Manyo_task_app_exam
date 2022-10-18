# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create!(
  title: 'first_task',
  content: 'ごはんを炊く',
  deadline_on: Date.today,
  priority: 'high',
  status: 'done',
)

Task.create!(
  title: 'second_task',
  content: '梅干しを買う',
  deadline_on: Date.today.since(1.day),
  priority: 'middle',
  status: 'doing',
)

Task.create!(
  title: 'third_task',
  content: 'おにぎりを作る',
  deadline_on: Date.today.since(2.day),
  priority: 'low',
  status: 'todo',
)

7.times do |i|
  Task.find_or_create_by!(
    title: "Task#{i+1}",
    content: "腹筋#{i*100}回",
    deadline_on: Date.today.since(3.day),
    priority: 'low',
    status: 'todo',
  )
end