require 'spec_helper'

describe "static_pages" do

  subject { page }
  
  describe "home page" do 
    before { visit home_path }
    it { should have_title("LVE | Home") }
  end

  describe "about page" do
    before { visit about_path }
    it { should have_title("LVE | About") }
  end

  describe "help page" do
    before { visit help_path } 
    it { should have_title("LVE | Help") }
  end

  describe "contact page" do
    before { visit contact_path }
    it { should have_title("LVE | Contact") }
  end

end
      
   