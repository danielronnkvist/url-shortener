FactoryGirl.define do
  sequence :original do |n|
    "http://example#{n}.com/"
  end

  factory :link do
    original {generate(:original)}
    user {create(:user)}
  end
end
