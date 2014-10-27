require 'spec_helper'

describe "users" do
  
  subject { page }

  describe "signup page GET /signup" do
    before { visit signup_path }

    it { should have_title("LVE | Sign Up") }
    it { should have_selector('h1', text: "Sign Up") }
     
    describe "signup POST /users" do
      let(:submit) { "Sign Up" }

      context "valid information" do
        before do
          User.destroy_all
          fill_in "Name",                  with: "Amanda"
          fill_in "Email",                 with: "amanda@gmail.com"
          fill_in "Password",              with: "foobar"
          fill_in "Password confirmation", with: "foobar"
        end

        it "creates user" do 
          expect { click_button submit }.to change(User, :count).by(1)
        end

        describe "after submission" do
          before { click_button submit }

          it { should have_title("LVE | Amanda") }
          it { should have_selector("h1", text: "Amanda") }
        end
      end

      context "invalid information" do
        before do
          User.destroy_all
          fill_in "Name",      with: ""
          fill_in "Email",     with: "amanda@gmail.com"
          fill_in "Password",  with: "foobar"
          fill_in "Password confirmation", with: "foobar"
        end
        
        it "does not create user" do 
          expect { click_button submit }.not_to change(User, :count)
        end 

        describe "after submission" do
          before { click_button submit }

          it { should have_title("LVE | Sign Up") }
          it { should have_content("error") }
        end
      end
    end
  end

  describe "show page GET /users/:id" do
    before do
      User.destroy_all
      user = FactoryGirl.create(:user, name: "Amanda", email: "amanda@gmail.com")
      visit user_path(user.id)
    end

    it { should have_title("LVE | Amanda") }
    it { should have_selector('h1', text: "Name: Amanda") }
    it { should have_selector('h1', text: "Email: amanda@gmail.com")}
  end
end


      
