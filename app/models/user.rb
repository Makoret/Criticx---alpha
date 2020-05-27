class User < ApplicationRecord
     has_many :reviews
     
     validates :username, :email, presence: true, uniqueness: true
     validates :birth_date, presence: true

     validates :bd_checker, numericality: { less_than: Date.today. year - 16, message: "You should be 16 years old to create an account"}

     private
     def bd_checker
          self.birth_date.year
     end
end