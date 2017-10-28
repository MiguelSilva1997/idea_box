IMAGES = []
CATEGORIES = []

30.times do
  CATEGORIES << Category.create(title: Faker::Hacker.ingverb)
end

20.times do
  IMAGES << Image.create(name: Faker::Name.first_name, image: Faker::Fillmurray.image)
end

10.times do
user = User.create!(name: Faker::FamilyGuy.character, email: Faker::Internet.email, username: Faker::Internet.user_name, password: Faker::Internet.password)
  5.times do
    idea = user.ideas.create(title: Faker::Hacker.verb, content: LiterateRandomizer.paragraph)
    3.times do
      idea.images << IMAGES.sample
    end
  end
end

admin = User.create!(name: "Miguel", email: Faker::Internet.email, username: "Miguel", password: "1234", role: "admin")
10.times do
  idea = admin.ideas.create(title: Faker::Hacker.verb, content: LiterateRandomizer.paragraph, category_id: CATEGORIES.sample)
  4.times do
    idea.images << IMAGES.sample
  end
end
