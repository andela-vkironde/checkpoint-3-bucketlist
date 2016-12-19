class Item < ApplicationRecord
  extend Pagination
  belongs_to :bucketlist
  validates_presence_of :name
end
