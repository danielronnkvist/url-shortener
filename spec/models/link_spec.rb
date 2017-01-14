require 'rails_helper'

RSpec.describe Link, type: :model do
  before(:each) do
    @link = attributes_for(:link)
  end

  it "should create a new instance of a link given valid attributes" do
    Link.create!(@link)
  end
end
