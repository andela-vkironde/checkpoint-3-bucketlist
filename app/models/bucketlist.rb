class Bucketlist < ApplicationRecord
  extend Pagination
  validates_presence_of :name
  belongs_to :user
  has_many :items

  scope(:search, lambda do |name|
    bucketlists = where("name ILIKE ?", "%#{name}%")
    if bucketlists.blank?
      raise(
        ActiveRecord::RecordNotFound, Messages.not_found(name)
      )
    end
    bucketlists
  end)
end
