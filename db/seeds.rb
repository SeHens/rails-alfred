# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Startup.destroy_all

Startup.create!(
  name: 'n8n',
  logo_url: 'https://images.crunchbase.com/image/upload/c_pad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/ydjhgig6chouzm2mmik9',
  industry: 'Workflow Automation',
  country: 'Germany',
  homepage_url: 'https://n8n.io/',
  total_funding: 13.5,
  favorite: false
)

Startup.create!(
  name: 'n8n',
  logo_url: 'https://images.crunchbase.com/image/upload/c_pad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/ydjhgig6chouzm2mmik9',
  industry: 'Workflow Automation',
  country: 'Germany',
  homepage_url: 'https://n8n.io/',
  total_funding: 13.5,
  favorite: false
)


Startup.create!(
  name: 'n8n',
  logo_url: 'https://images.crunchbase.com/image/upload/c_pad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/ydjhgig6chouzm2mmik9',
  industry: 'Workflow Automation',
  country: 'Germany',
  homepage_url: 'https://n8n.io/',
  total_funding: 13.5,
  favorite: false
)


Startup.create!(
  name: 'n8n',
  logo_url: 'https://images.crunchbase.com/image/upload/c_pad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/ydjhgig6chouzm2mmik9',
  industry: 'Workflow Automation',
  country: 'Germany',
  homepage_url: 'https://n8n.io/',
  total_funding: 13.5,
  favorite: false
)


Startup.create!(
  name: 'n8n',
  logo_url: 'https://images.crunchbase.com/image/upload/c_pad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/ydjhgig6chouzm2mmik9',
  industry: 'Workflow Automation',
  country: 'Germany',
  homepage_url: 'https://n8n.io/',
  total_funding: 13.5,
  favorite: false
)
