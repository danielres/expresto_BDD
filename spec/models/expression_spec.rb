require 'spec_helper'

describe Expression do

  before(:each) do

    @language = FactoryGirl.create(:language)
    @author   = FactoryGirl.create(:user)

    @attr = {
      :body         => "Example Expression",
      :meaning      => "Example Expression Meaning",
      :author_id    => @author.id,
      :language_id  => @language.id
    }
  end

  it "should create a new instance given a valid attribute" do
    Expression.create!(@attr)
  end

  it "should require a body" do
    no_body_expression = Expression.new(@attr.merge(:body => ""))
    no_body_expression.should_not be_valid
  end

  it "should not require a meaning" do
    no_meaning_expression = Expression.new(@attr.merge(:meaning => ""))
    no_meaning_expression.should be_valid
  end

  it "should require an author" do
    no_author_expression = Expression.new(@attr.merge(:author_id => ""))
    no_author_expression.should_not be_valid
  end

  it "should require a language" do
    no_language_expression = Expression.new(@attr.merge(:language_id => ""))
    no_language_expression.should_not be_valid
  end

  it "should belong to an author" do
    @expression   = Expression.new
    @expression.author = @author
    assert @expression.author    == @author
    assert @expression.author_id == @author.id
  end

  it "should belong to a language" do
    @expression   = Expression.new
    @language     = FactoryGirl.create(:language)
    @expression.language = @language
    assert @expression.language    == @language
    assert @expression.language_id == @language.id
  end

end