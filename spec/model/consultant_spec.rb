require 'spec_helper'

describe Consultant do
  
  before { @consultant = Consultant.new(first_name: "Example", last_name: "Consultant", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }

  subject { @consultant }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest)}
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { @consultant.last_name = " " }
    it { should_not be_valid }
  end
  
  describe "when last name is too long" do
    before { @consultant.last_name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[consultant@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @consultant.email = invalid_address
        @consultant.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @consultant.email = valid_address
        @consultant.should be_valid
      end      
    end
  end
  
  describe "when email address is already taken" do
    before do
      consultant_with_same_email = @consultant.dup
      consultant_with_same_email.email = @consultant.email.upcase
      consultant_with_same_email.save
    end

    it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before { @consultant.password = @consultant.password_confirmation = " " }
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { @consultant.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "when password confirmation is nil" do
    before { @consultant.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  describe "return value of authenticate method" do
    before { @consultant.save }
    let(:found_consultant) { Consultant.find_by_email(@consultant.email) }
  
    describe "with valid password" do
      it { should == found_consultant.authenticate(@consultant.password) }
    end
  
    describe "with invalid password" do
      let(:consultant_for_invalid_password) { found_consultant.authenticate("invalid") }
  
      it { should_not == consultant_for_invalid_password }
      specify { consultant_for_invalid_password.should be_false }
    end
  end
  
  describe "with a password that's too short" do
    before { @consultant.password = @consultant.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
  
end