class Game < ApplicationRecord
     has_many :involved_company
     has_many :companies, through: :involved_company
     has_and_belongs_to_many :platforms
     has_and_belongs_to_many :genres
end
