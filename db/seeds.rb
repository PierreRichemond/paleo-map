
require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Dinosaur.destroy_all
  puts "All dinosaurs deleted from db"

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath0 = 'db/100dinos.csv'
filepath1 = 'db/diplodocuses.csv'
filepath2 = 'db/stegosauruses.csv'
filepath3 = 'db/Tyrannosauruses.csv'

CSV.foreach(filepath0, csv_options) do |row|
  Dinosaur.create!(
    name: row[9],
    # tag_list: 'Tyrannosaure' if dino.name.include?('Tyrann'),
    # tag_list: 'Diplodocus' if dino.name.include?('Diplodocus'),
    # tag_list: 'Ankylosaurus' if dino.name.include? ('Ankylosaurus'),
    # tag_list: 'Dilophosaurus' if dino.name.include? ('Dilophosaurus'),
    # tag_list: 'Gorgosaurus' if dino.name.include? ('Gorgosaurus'),
    longitude: row[17],
    latitude: row[18]
  )

  puts "#{Dinosaur.count} dinosaurs were created."
end

Dinosaur.all.each do |dino|
  dino.tag_list.add('Tyrannosaure') if dino.name.include?('Tyrann')
  dino.tag_list.add('Diplodocus') if dino.name.include?('Diplodocus')
  dino.tag_list.add('Ankylosaurus') if dino.name.include?('Ankylosaurus')
  dino.tag_list.add('Dilophosaurus') if dino.name.include?('Dilophosaurus')
  dino.tag_list.add('Gorgosaurus') if dino.name.include?('Gorgosaurus')
  dino.save
end


# CSV.foreach(filepath1, csv_options) do |row|
#   Dinosaur.create!(
#     name: row[9],
#     longitude: row[17],
#     latitude: row[18]
#   )
#   puts "#{Dinosaur.count} diplodocuses were created."
# end

# CSV.foreach(filepath2, csv_options) do |row|
#   Dinosaur.create!(
#     name: row[9],
#     longitude: row[17],
#     latitude: row[18]
#   )
#   puts "#{Dinosaur.count} stegosauruses were created."
# end

# CSV.foreach(filepath3, csv_options) do |row|
#   Dinosaur.create!(
#     name: row[9],
#     longitude: row[17],
#     latitude: row[18]
#   )
#   puts "#{Dinosaur.count} Tyrannosauruses were created."
# end

puts "#{Dinosaur.count} dinosaurs were created."
