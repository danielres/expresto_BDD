require 'spec_helper'

describe Expression do

  before(:each) do
    FactoryGirl.create(:language)
    FactoryGirl.create(:user)
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create(:expression).should be_valid
  end

  it "should require a body" do
    FactoryGirl.build(:expression, :body => '').should_not be_valid
  end

  it "should not require a meaning" do
    FactoryGirl.build(:expression, :meaning => '').should be_valid
  end

   it "should require an author" do
     FactoryGirl.build(:expression, :author => nil).should_not be_valid
   end

  it "should require a language" do
    FactoryGirl.build(:expression, :language => nil).should_not be_valid
  end

  it "should belong to an author" do
    FactoryGirl.build(:expression).author.should be_kind_of(User)
  end

  it "should belong to a language" do
    FactoryGirl.build(:expression).language.should be_kind_of(Language)
  end
end