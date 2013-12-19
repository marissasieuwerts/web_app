require 'spec_helper'

describe "User pages" do

  subject { page }
  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit users_path
    end
    
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "student_id",   with: "99999999"
        fill_in "Password",     with: "example"
        fill_in "Confirmation", with: "example"
      end
      

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
    describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(student_id: '99999999') }

        it { should have_link('Sign out') }
        it { should have_title(user.student_id) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end
end