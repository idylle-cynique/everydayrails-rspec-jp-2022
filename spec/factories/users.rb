FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name { "Aaron" }
    last_name { "Sumner" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }

    factory :other_user do
      first_name { "Jane" }
      last_name { "Tester" }
      sequence(:email) { |n| "jester#{n}@example.com" }
      password { "dottle-nouveau-pavilion-tights-furze" }
    end
  end
end
