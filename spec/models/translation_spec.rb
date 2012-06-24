require 'spec_helper'

describe Translation do
  it "should create a new instance given valid attributes" do
    FactoryGirl.create(:translation).should be_valid
  end
  it "should require a litteral translation" do
    FactoryGirl.build(:translation, :body_litteral => '').should_not be_valid
  end
  it "should require a semantic translation" do
    FactoryGirl.build(:translation, :body_semantic => '').should_not be_valid
  end
  it "should belong to an expression" do
    expression = FactoryGirl.build(:expression)
    FactoryGirl.build(:translation, :expression => expression).expression.should be(expression)
  end
  it "should belong to an author" do
    author = FactoryGirl.build(:author)
    FactoryGirl.build(:translation, :author => author).author.should be(author)
  end
  it "should belong to a language" do
    language = FactoryGirl.build(:language)
    FactoryGirl.build(:translation, :language => language).language.should be(language)
  end
end
