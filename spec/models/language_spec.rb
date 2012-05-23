require 'spec_helper'

describe Language do

  it "should require a language code" do
    FactoryGirl.build(:language, :code => '').should_not be_valid
  end

  it "should require a language name" do
    FactoryGirl.build(:language, :name => '').should_not be_valid
  end


end
