
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
filepath = 'db/list-dinos.csv'

CSV.foreach(filepath, csv_options) do |row|
  Dinosaur.create!(
    name: row[9],
    longitude: row[17],
    latitude: row[18]
  )
  puts "#{Dinosaur.count} dinosaurs were created."
end
