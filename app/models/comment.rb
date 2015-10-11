class Comment < ActiveRecord::Base
  belongs_to :normal_user
  belongs_to :commentable, polymorphic: true

  validates_presence_of :message, :rating, :commentable, :normal_user
end
