FactoryGirl.define do
  factory :user do
    username "EvietheBot"
    email_address "evietheva@gmail.com"
    password "pass1234"
    profile_description "Just you're regular AI Bot, nothing special."
  end

  factory :user2, class: User do
    username "EvietheBot"
    email_address "estherleongym@gmail.com"
    password "pass1234"
    profile_description "Just you're regular AI Bot, nothing special."
  end

end
