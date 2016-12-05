FactoryGirl.define do
  factory :item do
    name { Faker::Space::galaxy }
    done false
    bucket_list
  end
end
