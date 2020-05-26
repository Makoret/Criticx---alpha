class Company < ApplicationRecord
     has_many :involved_company
     has_many :games, through: :involved_company
end
