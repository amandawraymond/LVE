# require 'spec_helper'

# describe ArtistsController, type: :controller do

#   describe "GET show" do
#     let(:artist) { FactoryGirl.create(:artist) }
    
#     it "assigns requested artist to @artist" do
#       get :show, id: artist.id
#       expect(assigns(:artist)).to eq(artist)
#     end

#      it "renders :show" do
#       get :show, id: artist.id
#       expect(response).to render_template(:show)
#     end
#   end

#   describe "GET new" do
#     it "assigns a new Artist to @artist" do
#       get :new
#       assigns(:artist).should be_a_new(Artist)
#     end

#     it "renders :new" do
#       get :new
#       expect(response).to render_template(:new)
#     end
#   end

#   describe "POST create" do
#     context "user adds artist" do
#       it "saves the new Artist to @artist" do
#         expect{
#           post :create, artist: FactoryGirl.attributes_for(:artist)
#         }.to change(Artist, :count).by(1)
#       end
#     end
      
#       it "redirects to :show" do
#        post :create, artist: FactoryGirl.attributes_for(:artist)
#         last_artist = Artist.last
#         expect(response).to redirect_to(artist_path(last_artist.id))
#       end
#     end

#   describe "GET index" do
#     before { Artist.destroy_all }
    
#     let(:first_artist) { FactoryGirl.create(:artist, name: "Madonna") }
#     let(:second_artist) { FactoryGirl.create(:artist, title: "Cher") }

#     it "renders :index" do
#       get :index
#       expect(response).to render_template(:index)
#     end
  
#     it "assigns all artists to @artists as an array" do 
#       get :index
#       assigns(:artists).should eq([first_artist, second_artist])
#     end
#   end
  

#   describe "DELETE destroy" do
#      let!(:artist) { FactoryGirl.create(:artist) }

#     it "deletes the requested artist" do
#       expect {
#         delete :destroy, id: artist.id
#       }.to change(Artist, :count).by(-1)
#     end

#     it "redirects to the :index" do
#       delete :destroy, id: artist.id
#       expect(response).to redirect_to(artists_path)
#     end
#   end
# end

