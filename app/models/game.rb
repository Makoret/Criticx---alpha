class Game < ApplicationRecord
     has_many :involved_company
     has_many :companies, through: :involved_company
     has_and_belongs_to_many :platforms
     has_and_belongs_to_many :genres
     has_many :expansions, class_name: 'Game', foreign_key: 'parent_id'
     belongs_to :parent, class_name: 'Game', optional: true
     has_many :reviews, as: :reviewable
     enum category: { main_game: 0, expansion:1}

     validates :name, presence: true, uniqueness: true
     validates :category, presence: true
     validates :rating, inclusion: {in: 0..100} 
     validates :parent_id, presence: true, if: :parent_id_custom_value?

     private
     def parent_id_custom_value
          if self.category == "expansion"
               Game.find(self.parent_id)
          end
     end
end