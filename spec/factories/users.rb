FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email  {Faker::Internet.email}
    password { 'abc123' }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_reading { 'ヤマダ' }
    first_name_reading { 'タロウ' }
    birthday { '1900-01-01' }
  end
end
