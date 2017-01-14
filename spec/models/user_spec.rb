require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = attributes_for(:user)
  end

  it "should create a new instance of a user given valid attributes" do
    User.create!(@user)
  end
end
