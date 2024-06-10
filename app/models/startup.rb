class Startup < ApplicationRecord
  has_many :favorites
  has_many :favoriting_users, through: :favorites, source: :user

  validates :name, presence: true
  validates :homepage_url, presence: true
  validates :industry, presence: true
  validates :hq_location, presence: true
  validates :total_funding, presence: true
  validates :description, presence: true
end
