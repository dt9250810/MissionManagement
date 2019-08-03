# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


50.times do
  Mission.create(
    title: Faker::Lorem.question,
    context: Faker::Lorem.sentence,
    status: [1,2,3].sample,
    priority: [1,2,3].sample,
    start_time: Faker::Time.between_dates(from: Date.today - 2, to: Date.today, period: :all),
    end_time: Faker::Time.between_dates(from: Date.today + 2, to: Date.today, period: :all),
  )
end
