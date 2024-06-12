# startup.rb
class Startup < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favoriting_users, through: :favorites, source: :user

  attribute :favorite, :boolean, default: false

  validates :name, :homepage_url, :industry, :hq_location, :total_funding, :description, presence: true
end
