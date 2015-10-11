module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
  end

  def rating
    nums = comments.map(&:rating)
    return nil if nums.empty?
    nums.sum.to_f / nums.count
  end
end