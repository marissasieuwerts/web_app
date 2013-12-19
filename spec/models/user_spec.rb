require 'spec_helper'

describe User do

  before do
    @user = User.new(student_id: "99999999",
    				password: "example", password_confirmation: "example")
  end

  subject { @user }

  it { should respond_to(:student_id) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to:(:password_confirmation) }
  it { should respond_to:(:remember_token) }
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_courses) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }
  it { should respond_to(:followers) }
  
  it { should be_valid }

  describe "when student_id is not present" do
    before { @user.student_id = " " }
    it { should_not be_valid }
  end
  
  describe "when student_id is too long" do
    before { @user.student_id = "a" * 8 }
    it { should_not be_valid }
  end
  
    describe "when student_id is too short" do
    before { @user.student_id = "a" * 7 }
    it { should_not be_valid }
  end
  
  describe "when student_id is already taken" do
    before do
      user_with_same_student_id = @user.dup
      user_with_same_student_id.save
    end

    it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before do
      @user = User.new(student_id: "10070729",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
	it { should respond_to(:authenticate) }
  
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(student_id: @user.student_id) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
  
    describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  
  	describe "follower methods" do
    it { should respond_to(:follower) }
    its(:follower) { should eq follower }
  end
  
  describe "following" do
	let(:course) { (:course) }
    before do
      @user.save
      @user.follow!(course)
    end
    
    describe "and unfollowing" do
      before { @user.unfollow!(course) }

      it { should_not be_following(course) }
      its(:followed_courses) { should_not include(course) }
    end

    it { should be_following(course) }
    its(:followed_courses) { should include(course) }
  end
  

    describe "followed course" do
      subject { course }
      its(:followers) { should include(@user) }
    end
end