# encoding: utf-8
require 'spec_helper'

describe Expression do

#   before(:each) do
#     FactoryGirl.create(:language)
#     FactoryGirl.create(:user)
#   end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create(:expression).should be_valid
  end

  it "should properly reformat its body upon save" do
    f = FactoryGirl.create(:expression, :body => '   body    to clean  ')
    f.save
    f.body.should == 'Body to clean.'
    f = FactoryGirl.create(:expression, :body => 'être une expression')
    f.save
    f.body.should == 'Être une expression.'
  end

  it "should require a body" do
    FactoryGirl.build(:expression, :body => '').should_not be_valid
  end

  it "should require a meaning" do
    FactoryGirl.build(:expression, :meaning => '').should_not be_valid
  end

#   it "should require the response to 'created by author'" do
#     FactoryGirl.build(:expression, :created_by_author => '').should_not be_valid
#   end

   it "should require an author" do
     FactoryGirl.build(:expression, :author => nil).should_not be_valid
   end

  it "should require a language" do
    FactoryGirl.build(:expression, :language => nil).should_not be_valid
  end

  it "should belong to an author" do
    author = FactoryGirl.build(:author)
    FactoryGirl.build(:expression, :author => author).author.should be(author)
  end

  it "should belong to a language" do
    language = FactoryGirl.build(:language)
    FactoryGirl.build(:expression, :language => language).language.should be(language)
  end

end