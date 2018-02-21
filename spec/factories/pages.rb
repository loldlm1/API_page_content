FactoryBot.define do
  factory :page do
    url 'www.google.com'
    content {
      {
        h1: ['a'],
        h2: ['b'],
        h3: ['c'],
        link: ['click here']
      }
    }
  end
end
