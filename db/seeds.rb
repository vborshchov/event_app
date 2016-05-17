# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create(
  [
    {
      name: "Alice",
      email: "alice@example.com",
      phone: "555-555-1234",
      skype: "alice",
      about: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus commodi dicta, sint architecto ad illum voluptatum praesentium saepe. Laborum sunt nobis a ipsa officiis unde voluptatem nulla, quaerat sequi eum?",
      password: "alicealice",
      password_confirmation: "alicealice"
    },
    {
      name: "Bob",
      email: "bob@example.com",
      phone: "555-555-4321",
      skype: "bob",
      about: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus commodi dicta, sint architecto ad illum voluptatum praesentium saepe. Laborum sunt nobis a ipsa officiis unde voluptatem nulla, quaerat sequi eum?",
      password: "bobbobbob",
      password_confirmation: "bobbobbob"
    }
  ]
) 

users.each do |user|
  Event.create(
    [
      {
        name: "dolor #{user.name}",
        address: "Copenhagen",
        min_users: 2,
        max_users: 5,
        user_id: user.id,
        category: Category.first
      },
      {
        name: "amet #{user.name}",
        address: "Cherkassy",
        min_users: 3,
        max_users: 10,
        user_id: user.id,
        category: Category.last
      }
    ]
  )
end