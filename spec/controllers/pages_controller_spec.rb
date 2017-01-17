require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it "should render the correct action for root" do
    expect(get: root_url(subdomain: nil)).to route_to(
        controller: "pages",
        action: "home")
  end

  it "should redirect to links if signed in" do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
    get :home
    expect(response).to redirect_to(links_path)
  end
end
