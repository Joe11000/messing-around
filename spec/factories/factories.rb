
FactoryBot.define do
  factory :user, aliases: [:owner] do
    email {('a'..'z').to_a.sample(4).join + '@gmail.com'}
    age {rand 1..60}
    sexuality {User.sexualities.keys.sample}
    birthday { ( Time.now - rand(Time.now.to_i) ) }
    password {'pass'}
  end

  factory :dog do
    add_attribute(:name) { Faker::Dog.name }
    association :owner, factory: :user
  end
end



