# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
john = User.create(email: 'john@doe.com',
  password: 'password',
  password_confirmation: 'password'
)

10.times do |i|
  UserPost.create!(
    title: "Post #{i + 1}",
    body: "This is the content of post #{i + 1}.",
    user_id: User.first.id
    # Add other attributes as needed
  )
end