require 'spec_helper'

describe ConcertsController, type: :controller do
  before do
    User.destroy_all
  end
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user, no_capybara: true }

  describe "GET new" do
    it "assigns a new Concert to @concert" do
      get :new
      assigns(:concert).should be_a_new(Concert)
    end

    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "user adds concert" do
      it "saves the new Concert to @concert" do
        expect{
          post :create, concert: FactoryGirl.attributes_for(:concert)
        }.to change(Concert, :count).by(1)
      end
    end
      
      it "redirects to /myconcerts" do
       post :create, concert: FactoryGirl.attributes_for(:concert)
        expect(response).to redirect_to(myconcerts_path)
      end
    end

  describe "GET index" do
    it "renders :index" do
      get :index
      expect(response).to redirect_to(new_concert_path)
    end
  end
  

  describe "DELETE destroy" do
     let!(:concert) { FactoryGirl.create(:concert) }

    it "deletes the requested concert" do
      expect {
        delete :destroy, id: concert.id
      }.to change(Concert, :count).by(-1)
    end

    it "redirects to the /myconcerts" do
      delete :destroy, id: concert.id
      expect(response).to redirect_to(myconcerts_path)
    end
  end
end




