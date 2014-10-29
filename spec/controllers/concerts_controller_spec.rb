# require 'spec_helper'

# describe ConcertsController, type: :controller do
#   describe "GET show" do
#     let(:concert) { FactoryGirl.create(:concert) }
    
#     it "assigns requested concert to @concert" do
#       get :show, id: concert.id
#       expect(assigns(:concert)).to eq(concert)
#     end

#      it "renders :show" do
#       get :show, id: concert.id
#       expect(response).to render_template(:show)
#     end
#   end

#   describe "GET new" do
#     it "assigns a new Concert to @concert" do
#       get :new
#       assigns(:concert).should be_a_new(Concert)
#     end

#     it "renders :new" do
#       get :new
#       expect(response).to render_template(:new)
#     end
#   end

#   describe "POST create" do
#     context "user adds concert" do
#       it "saves the new Concert to @concert" do
#         expect{
#           post :create, concert: FactoryGirl.attributes_for(:concert)
#         }.to change(Concert, :count).by(1)
#       end
#     end
      
#       it "redirects to :show" do
#        post :create, concert: FactoryGirl.attributes_for(:concert)
#         last_concert = Concert.last
#         expect(response).to redirect_to(concert_path(last_concert.id))
#       end
#     end

#   describe "GET index" do
#     before { Concert.destroy_all }
    
#     let(:first_concert) { FactoryGirl.create(:concert, performing_artists: "Madonna") }
#     let(:second_concert) { FactoryGirl.create(:concert, performing_artists: "Cher") }

#     it "renders :index" do
#       get :index
#       expect(response).to render_template(:index)
#     end
  
#     it "assigns all concerts to @concerts as an array" do 
#       get :index
#       assigns(:concert).should eq([first_concert, second_concert])
#     end
#   end
  

#   describe "DELETE destroy" do
#      let!(:concert) { FactoryGirl.create(:concert) }

#     it "deletes the requested concert" do
#       expect {
#         delete :destroy, id: concert.id
#       }.to change(Concert, :count).by(-1)
#     end

#     it "redirects to the :index" do
#       delete :destroy, id: concert.id
#       expect(response).to redirect_to(concerts_path)
#     end
#   end
# end


