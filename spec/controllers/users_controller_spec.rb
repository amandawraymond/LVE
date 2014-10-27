require 'rails_helper'

describe UsersController, type: :controller do

  describe "GET new" do
    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET show" do
    it "renders :show" do
      get :show
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
