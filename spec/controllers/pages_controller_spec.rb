require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it "should render the correct action for root" do
    expect(get: root_url(subdomain: nil)).to route_to(
        controller: "pages",
        action: "home")
  end
end
