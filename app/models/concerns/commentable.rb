module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
    after_initialize { self.rating = 5 if self.new_record? }
  end

end