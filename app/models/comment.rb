class Comment < ApplicationRecord
  belongs_to :book

  scope :filter_len, ->(len) { limit(len) if len.to_i > 0}
end
