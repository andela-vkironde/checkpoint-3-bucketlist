class Item < ApplicationRecord
  extend Paginable
  belongs_to :bucketlist
  validates_presence_of :name
end
