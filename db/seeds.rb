# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Simulation au 9 septembre"

Chapter.destroy_all
DbmPage.destroy_all


# chapter_63 = Chapter.create!(
#   number: 63,
#   finished: false,
#   title: "bough",
#   img_url: "http://www.dragonball-multiverse.com/fr/pages/final/1459.jpg"
# )

chapter_64 = Chapter.create!(
  number: 64,
  finished: false,
  title: "L'âge des Saiyans",
  img_url: "http://www.dragonball-multiverse.com/fr/pages/final/1459.jpg"
)

page_1482 = DbmPage.create!(
  number: 1482,
  url: "http://www.dragonball-multiverse.com/fr/page-1482.html",
  first_page: false,
  chapter: chapter_64
)

puts "#{Chapter.count} chapter created"
puts "#{DbmPage.count} page created"
