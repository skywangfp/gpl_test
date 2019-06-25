class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :filter_page, ->(page_size, page_no) {
    page_size, page_no = page_size.to_i, page_no.to_i
    page_size = 15 if page_size < 1
    page_no = 0 if page_no < 0

    offset(page_size * page_no).limit(page_size)
  }
end
