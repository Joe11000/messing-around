FactoryBot.define do
  sequence(:counter) {|i| i}

  factory :user, aliases: [:owner] do
    # add_attribute(:name) { Faker::Name.first_name }
    sequence(:name) {|n| Faker::Name.first_name + n.to_s }

    sequence(:email) {|n| name + n.to_s + '@gmail.com'}

    sexuality {User.sexualities.keys.sample}
    birthday { ( Time.now - rand(Time.now.to_i) ) }
    password {'pass'}

    trait :admin do
      security_clearance { 1 }
    end

    trait :dog_sitter do
      transient do
        num_dogs { 3 }
        squeeky_toys_per_dog { 1 }
        fetch_toys_per_dog { 1 }
      end

      after(:create) do |user, evocation|
        create_list(:dog, evocation.num_dogs, owner: user) do |dog|
          dog.toys << create_list(:squeeky_toy, evocation.squeeky_toys_per_dog)
          dog.toys << create_list(:fetch_toy, evocation.fetch_toys_per_dog)
        end
      end

      after :create, &:clock_in
    end
  end

  factory :dog do
    sequence(:name) {|n| Faker::Dog.name + n.to_s }
    association :owner, factory: :user
  end

  factory :toy do
    cost { rand(0.5..10.0).round(2)}
    fun_level {rand(0..10)}

    factory :squeeky_toy do
      type 'SqueekyToy'
    end

    factory :fetch_toy do
      type 'FetchToy'
    end
  end
end
