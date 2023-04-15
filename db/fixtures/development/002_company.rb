companies = []
10.times do
  companies << { name: Faker::Company.name, address: Faker::Address.full_address }
end

Company.seed(companies)
