class Book < ApplicationRecord
  has_many :comments, dependent: :destroy

  scope :filter_name, ->(name) { where 'name like ?', "%#{name}%" if name.present?}
  scope :filter_author, ->(author) { where 'author like ?', "%#{author}%" if author.present?}
  scope :filter_price_start, ->(price) { where 'price >= ?', price.to_f if price.present? }
  scope :filter_price_end, ->(price) { where 'price <= ?', price.to_f if price.present? }
end
