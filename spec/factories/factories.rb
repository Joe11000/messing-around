FactoryBot.define do
  factory :user do
    email {('a'..'z').to_a.sample(4).join + '@gmail.com'}
    age {rand 1..60}
    sexuality {User.sexualities.keys.sample}
    birthday { ( Time.now - rand(Time.now.to_i) ) }
    password {'pass'}
  end
end


