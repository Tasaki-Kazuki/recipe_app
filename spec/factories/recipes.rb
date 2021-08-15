FactoryBot.define do
  factory :recipe do
    user { nil }
    title { "MyString" }
    body { "MyText" }
  end
end
