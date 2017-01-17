require 'rails_helper'

RSpec.describe User, type: :model do

  describe "create user" do
    before(:each) do
      @user = attributes_for(:user)
    end

    it "should create a new instance of a user given valid attributes" do
      User.create!(@user)
    end
  end

  describe "handle a users links" do
    before(:each) do
      @user = create(:user)
    end

    before(:each) do
      5.times do
        @user.links << build(:no_user_link)
      end
    end

    it "should be able to have many links" do
      expect(@user.links.count).to eq(5)
    end

    it "should delete the users links when the user is destroyed" do
      link = Link.create(original: 'test.com', user: @user)
      @user.destroy!
      expect{Link.find(link.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
