require 'spec_helper'

describe "users" do
  
  subject { page }

  describe "signup page GET /signup" do
    before { visit signup_path }

    it { should have_title("LVE | Sign Up") }
    it { should have_selector('h1', text: "Sign Up") }
  end
end


  
