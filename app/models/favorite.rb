# favorite.rb
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :startup
end
