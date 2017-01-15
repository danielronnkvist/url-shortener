FactoryGirl.define do
  sequence :original do |n|
    "http://example#{n}.com/"
  end

  factory :link do
    original {generate(:original)}
    user {create(:user)}
  end

  factory :no_user_link, class: Link do
    original {generate(:original)}
  end
end
