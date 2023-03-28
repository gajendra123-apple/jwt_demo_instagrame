FactoryBot.define do
  factory :user, class: 'User' do
    user_name { "alskjd" }
    email { "raj#{Random.rand(1..1000)}@gmail.com" }
    password { "Passwor@123" }
  end
end
