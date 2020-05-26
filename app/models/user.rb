class User < ApplicationRecord
     has_many :reviews
     after_create :after_create do
          
     end

     private
     def count_up
          if self.user.review_count.nil? self.user.update(review_count:0)
          end
          count = self.user.review_count
          self.user.update(review_count: count + 1)
     end
     def count_down
          count = self.user.review_count
          self.user.update(review_count: count + 1)
     end
end