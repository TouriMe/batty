class Comment < ActiveRecord::Base
  belongs_to :normal_user
  belongs_to :commentable, polymorphic: true

  validates_presence_of :message, :rating, :commentable, :normal_user

  after_save do
    rating_arr = self.commentable.comments.pluck(:rating)
    self.commentable.rating = rating_arr.sum / rating_arr.length
    self.commentable.save
  end
end
