require 'rails_helper'

describe UsersController, type: :controller do

  describe "GET new" do
    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET show" do
    let(:user) { FactoryGirl.create(:user) }
    
    it "assigns requested user to @user" do
      get :show, id: user.id
      assigns(:user).should eq(user)
    end
    
    it "renders :show" do
      get :show, id: user.id
      expect(response).to render_template(:show)
    end
  end

    # describe "GET create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
