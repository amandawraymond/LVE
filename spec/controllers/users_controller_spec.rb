require 'rails_helper'

describe UsersController, type: :controller do

  describe "GET new" do
    it "assigns a new User to @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end

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

   describe "POST create" do
    context "with valid attributes" do
      it "saves the new User to @user" do
        expect{
          post :create, user:  FactoryGirl.attributes_for(:user) 
          }.to change(User, :count).by(1)
      end
      
      it "redirects to :show" do
        post :create, user: FactoryGirl.attributes_for(:user) 
        last_user = User.last
        expect(response).to redirect_to(user_path(last_user.id))
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new User to @user" do
         expect{
          post :create, user: FactoryGirl.attributes_for(:user,email: " ") 
        }.to_not change(User, :count)
      end
      
      it "re-renders :new" do
        post :create, user: FactoryGirl.attributes_for(:user, email: " ") 
        expect(response).to render_template(:new)
      end
    end
  end
end
