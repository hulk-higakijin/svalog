FactoryBot.define do
  factory :shift do
    user { nil }
    start_at { "2023-04-18 13:49:16" }
    finish_at { "2023-04-18 13:49:16" }
    break_time { 1 }
    hourly_wage { 1 }
    date { "2023-04-18" }
  end
end
