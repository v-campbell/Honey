FactoryBot.define do
  factory :pollen_collected do
    bee_id { 1 }
    date_collected { "2020-05-16" }
    pollen_globs_collected { 1 }
  end
end
