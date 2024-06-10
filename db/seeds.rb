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
  hq_location: 'Germany',
  homepage_url: 'https://n8n.io/',
  total_funding: 13.5,
  favorite: false,
  description: 'n8n is a free and open node-based Workflow Automation Tool. It can be self-hosted, easily extended, and used with third party web applications or custom in-house tools to automate repetitive tasks. With n8n, for the first time, people can move beyond simple integrations to build multi-step workflows that combine both 3rd party APIs and your owninternal tools to create easy to use automations that snap together all the pieces of what would otherwise be very complex, disconnected systems.'
)

Startup.create!(
  name: 'Copado',
  logo_url: 'https://images.crunchbase.com/image/upload/c_pad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/tcxj8zcyoacn908i14z2',
  industry: 'Developer Tools',
  hq_location: 'United States',
  homepage_url: 'https://www.copado.com/',
  total_funding: 270.8,
  favorite: false,
  description: 'Copado is the DevOps platform enabling the largest digital transformations on Salesforce. Copado accelerates digital transformation projects by automating the release process, increasing developer productivity, and maximizing return on cloud investments. Copado DevOps 360™ includes Value Planning, Continuous Delivery, AutomatedTesting, and Compliance.'
)

Startup.create!(
  name: 'Sparetech',
  logo_url: 'https://images.crunchbase.com/image/upload/c_pad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/jxvfpcrsapqkp6xyv57y',
  industry: 'Procurement',
  hq_location: 'Germany',
  homepage_url: 'https://www.sparetech.io/',
  total_funding: 15.3,
  favorite: false,
  description: 'SPARETECH creates a collaboration platform for manufacturing companies to digitize their spare part inventories, calculate their true demand, compare parts from various suppliers, and source the appropriate part outside or within their production network. The software compares spare part lists from clients to the product database and generatesstandardized data sets for ERP systems. They allow the customer to leverage sourcing and usage within the production network.'
)

Startup.create!(
  name: 'Weaviate',
  logo_url: 'https://images.crunchbase.com/image/upload/c_pad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/xt1pfa9berdy2nzym88q',
  industry: 'Database',
  hq_location: 'Netherlands',
  homepage_url: 'https://weaviate.io/',
  total_funding: 67.7,
  favorite: false,
  description: 'Weaviate develops a hybrid SaaS platform to build search and recommendation systems. Its open-source AI vector search engine has extensions in the platform for specific use cases such as semantic search, plugins to integrate into any application, and a console to understand their data.'
)

Startup.create!(
  name: 'HiBob',
  logo_url: 'https://images.crunchbase.com/image/upload/c_pad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/zsdh1tldjg5pnbkjxz0c',
  industry: 'Human Resources',
  hq_location: 'Israel',
  homepage_url: 'https://www.hibob.com/',
  total_funding: 574.0,
  favorite: false,
  description: 'Hibob was founded to modernize HR tech. The intuitive and data-driven platform, bob, was built for the way people work today: globally, remotely, and collaboratively. Since its launch in late 2015, bob has achieved consecutive triple-digit year-over-year growth, and become the HRIS of choice for more than 1,000 modern, midsize andmultinational companies who understand that a powerful, agile HR tech suite is mission critical and a key driver of organizational success. Fast-growing companies across the globe such as Monzo, Happy Socks, Gong, Fiverr, and VaynerMedia rely upon bob to help HR and managers connect, engage, develop and retain top talent.'
)
