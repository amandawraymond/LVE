require 'spec_helper'

describe ArtistsController, type: :controller do
  before do
    User.destroy_all
  end
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user, no_capybara: true }

  let(:artist) { FactoryGirl.create(:artist) }

  describe "GET new" do
    it "assigns a new Artist to @artist" do
      get :new
      assigns(:artist).should be_a_new(Artist)
    end

    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "user adds artist" do
      it "saves the new Artist to @artist" do
        expect{
          post :create, artist: FactoryGirl.attributes_for(:artist)
        }.to change(Artist, :count).by(1)
      end
    end
      
      it "redirects to /myartists" do
       post :create, artist: FactoryGirl.attributes_for(:artist)
        expect(response).to redirect_to(myartists_path)
      end
    end

  describe "GET index" do
    it "renders :index" do
      get :index
      expect(response).to redirect_to(new_artist_path)
    end
  end
  

  describe "DELETE destroy" do
     let!(:artist) { FactoryGirl.create(:artist) }

    it "deletes the requested artist" do
      expect {
        delete :destroy, id: artist.id
      }.to change(Artist, :count).by(-1)
    end

    it "redirects to the /myartists" do
      delete :destroy, id: artist.id
      expect(response).to redirect_to(myartists_path)
    end
  end
end

