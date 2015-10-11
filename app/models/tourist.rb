class Tourist < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :trip_comments
end

