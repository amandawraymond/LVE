require 'spec_helper'

describe Artist do
  let(:user) {FactoryGirl.create(:user) }
  before { @artist = user.artists.create(name: "Cher", similar: "Madonna") }

  subject { @artist }

  it { should respond_to(:name) }
  it { should respond_to(:photo) }
  it { should respond_to(:similar)  }
  it { should respond_to(:user) }
  it { should respond_to(:user_id) }
  it { should be_valid }  

  describe "validations" do
    describe "name" do
      describe "not present" do
        before { @artist.name = " "}
        it { should_not be_valid }
      end
    end
    
    describe "photo" do 
      context "default" do
        it "is provided" do
          new_artist = user.artists.new(name: "Radiohead")
          expect(new_artist.photo).to eq("http://i.imgur.com/Ha087R9.jpg")
        end
      end
    end
       
    describe "similar" do
      context "default" do
        it "is provided" do
          new_artist = user.artists.new(name: "Radiohead")
          expect(new_artist.similar).to eq("no similar artist listed")
        end
      end
    end

    describe "user_id" do
      context "not present" do
        before { @artist.user_id = nil }
        it { should_not be_valid }
      end
    end    
  end
end



