# encoding: utf-8
require 'spec_helper'

describe Comment do

  it "should create a new instance given valid attributes" do
    FactoryGirl.create(:comment).should be_valid
  end

  it "should require a body" do
    FactoryGirl.build(:comment, :body => '').should_not be_valid
  end

  it "should require a commentable_type" do
    FactoryGirl.build(:comment, :commentable_type => '').should_not be_valid
  end

  it "should require a commentable_id" do
    FactoryGirl.build(:comment, :commentable_id => nil).should_not be_valid
  end

  it "should belong to an user" do
    user = FactoryGirl.build(:user)
    FactoryGirl.build(:comment, :user => user).user.should be(user)

  end
  it "should require an user_id" do
    FactoryGirl.build(:comment, :user_id => nil).should_not be_valid
  end

end