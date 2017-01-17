require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe "handle signed in requests" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end

    describe "GET #index" do
      it "should render the correct index template" do
        get :index
        expect(assigns(:links)).to eq(subject.current_user.links)
      end
    end
  end

  it "shouldn't be able to visit without being signed in" do
    get :index
    expect(response).to redirect_to(new_user_session_path)
  end
end
