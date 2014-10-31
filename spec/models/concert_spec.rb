require 'spec_helper'

describe Concert do
  let(:user) {FactoryGirl.create(:user) }
  before { @concert = user.concerts.create(performing_artists: "Radiohead, Cher") }

  subject { @concert }

  it { should respond_to(:performing_artists) }
  it { should respond_to(:concert_date) }
  it { should respond_to(:concert_time)  }
  it { should respond_to(:venue) }
  it { should respond_to(:website) }
  it { should respond_to(:user) }
  it { should respond_to(:user_id) }
  it { should be_valid }  

  describe "validations" do
    describe "concert_date" do 
      context "default" do
        it "is provided" do
          new_concert = user.concerts.create(performing_artists: "Radiohead, Cher")
          expect(new_concert.concert_date).to eq("23/08/1988".to_date)
        end
      end
    end
       
    describe "concert_time" do
      context "default" do
        it "is provided" do
          new_concert = user.concerts.create(performing_artists: "Radiohead, Cher")
          expect(new_concert.concert_time).to eq("TBD")
        end
      end
    end

    describe "venue" do
      context "default" do
        it "is provided" do
          new_concert = user.concerts.create(performing_artists: "Radiohead, Cher")
          expect(new_concert.venue).to eq("TBD")
        end
      end
    end

    describe "website" do
      context "default" do
        it "is provided" do
          new_concert = user.concerts.create(performing_artists: "Radiohead, Cher")
          expect(new_concert.website).to eq("http://www.last.fm/")
        end
      end
    end

    describe "location" do
      context "default" do
        it "is provided" do
          new_concert = user.concerts.create(performing_artists: "Radiohead, Cher")
          expect(new_concert.location).to eq("OuterSpace")
        end
      end
    end

    describe "headliner" do
      context "default" do
        it "is provided" do
          new_concert = user.concerts.create(performing_artists: "Radiohead")
          expect(new_concert.headliner).to eq("Radiohead")
        end
      end
    end

    describe "user_id" do
      context "not present" do
        before { @concert.user_id = nil }
        it { should_not be_valid }
      end
    end    
  end
end



