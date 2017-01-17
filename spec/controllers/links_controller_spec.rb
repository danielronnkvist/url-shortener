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

    it "should assign a new Link" do
      get :new
      expect(assigns(:link)).to be_a(Link)
    end

    it "should create a new link" do
      post :create, params: {link: {original: 'http://google.com'}}
      expect(response).to redirect_to(links_path)
    end

    it "sholdn't create a new link due to no original" do
      post :create, params: {link: {original: nil}}
      expect(response).to render_template(:new)
    end

    it "should destroy link" do
      link = Link.create!(original: 'http://google.com', user: subject.current_user)
      delete :destroy, params: {id: link.id}
      expect{Link.find(link.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  it "shouldn't be able to visit without being signed in" do
    get :index
    expect(response).to redirect_to(new_user_session_path)
  end

  it "should redirect to links original url" do
    user = FactoryGirl.create(:user)
    link = Link.create!(original: 'http://google.com', user: user)
    get :redirect, params: {shortened: link.shortened}
    expect(response).to redirect_to('http://google.com')
  end

  it "should redirect to root path since no link was found" do
    get :redirect, params: {shortened: 'åäö'}
    expect(response).to redirect_to(root_path)
  end
end
