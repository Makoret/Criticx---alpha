class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  after_create :count_up
  after_destroy :count_down
  
  validates :body, presence: true
  validates :title, presence: true, length: { maximum: 40 }

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