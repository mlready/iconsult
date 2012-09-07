require 'spec_helper'

describe "ConsultantPages" do
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h2',    text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }
  end
  
  describe "profile page" do
    let(:consultant) { FactoryGirl.create(:consultant) }
    before { visit consultant_path(consultant) }
    
    it { should have_selector('title',    text: consultant.last_name) }
   end
  
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a consultant" do
        expect { click_button submit }.not_to change(Consultant, :count)
      end
      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "First Name",         with: "John"
        fill_in "Last Name",          with: "Doe"
        fill_in "Email",              with: "user@example.com"
        fill_in "Password",           with: "foobar"
        fill_in "Confirmation",       with: "foobar"
      end

      it "should create a consultant" do
        expect { click_button submit }.to change(Consultant, :count).by(1)
      end
      
      describe "after saving the consultant" do
        before { click_button submit }
        let(:consultant) { Consultant.find_by_email('user@example.com') }

        #it { should have_selector('title', text: consultant.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end
