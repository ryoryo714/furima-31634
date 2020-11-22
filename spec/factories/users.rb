FactoryBot.define do
  factory :user do
    nickname              {"nick"}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_day             {"1999-07-14"}
    email                 {"testman@example.com"}
    password              {"pas111"}
    password_confirmation {"pas111"}
  end
end