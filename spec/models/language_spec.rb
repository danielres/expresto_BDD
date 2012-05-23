require 'spec_helper'

describe Language do

  it "should require a language code" do
    FactoryGirl.build(:language, :code => '').should_not be_valid
  end

  it "should require a language name" do
    FactoryGirl.build(:language, :name => '').should_not be_valid
  end

  it "should have many expressions" do
    language  = FactoryGirl.build(:language)
    e1        = FactoryGirl.build(:expression)
    e2        = FactoryGirl.build(:expression)
    language.expressions << e1
    language.expressions << e2
    language.expressions.should == [ e1, e2 ]
  end


end
