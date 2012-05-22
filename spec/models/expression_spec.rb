require 'spec_helper'

describe Expression do

  before(:each) do
    @attr = {
      :body => "Example Expression",
      :meaning => "Example Expression Meaning",
      :author_id => 1,
      :language_id => 1
    }
  end

  it "should create a new instance given a valid attribute" do
    Expression.create!(@attr)
  end


end