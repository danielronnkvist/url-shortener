require 'rails_helper'

RSpec.describe Link, type: :model do
  before(:each) do
    @link = attributes_for(:link)
  end

  it "should create a new instance of a link given valid attributes" do
    Link.create!(@link)
  end

  it "should not create a new instance of a link given no user" do
    @link['user'] = nil
    expect{Link.create!(@link)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "should not create a new instance of a link given no original" do
    @link['original'] = nil
    expect{Link.create!(@link)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "should generate a unique shortened url after create" do
    link = Link.create(@link)
    expect(Link.where(shortened: link.shortened)).to eq([link])
  end
end
