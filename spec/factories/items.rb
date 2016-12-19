FactoryGirl.define do
  factory :item do
    name { Faker::Space.galaxy }
    done false
    bucketlist_id 1
  end
end
