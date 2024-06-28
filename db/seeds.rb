# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

puts "Cleaning database..."
Startup.destroy_all

csv_file_path = Rails.root.join('db', 'seed_data', 'startups.csv')

CSV.foreach(csv_file_path, headers: true, quote_char: '"') do |row|
  Startup.create!(
    name: row['name'],
    logo_url: row['logo_url'],
    industry: row['industry'],
    hq_location: row['hq_location'],
    homepage_url: row['homepage_url'],
    total_funding: row['total_funding'].to_f,
    round_name: row['round_name'],
    last_funding: row['last_funding'],
    top_3_investors: row['top_3_investors'],
    funding_date: row['funding_date'],
    cb_link: row['cb_link'],
    favorite: row['favorite'] == 'true',
    description: row['description']
  )
end

puts "Database seeded successfully!"
