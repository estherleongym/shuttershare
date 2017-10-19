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

  factory :user3, class: User do
    username "Estherleongym"
    email_address "estherleongym1@gmail.com"
    password "pass1234"
    profile_description "HI"
  end

  factory :user4, class: User do
    username "Dineshsingh"
    email_address "dinesh2404@gmail.com"
    password "pass1234"
    profile_description "Ola puppy"
  end
end
