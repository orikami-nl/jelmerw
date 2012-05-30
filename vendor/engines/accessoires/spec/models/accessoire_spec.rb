require 'spec_helper'

describe Accessoire do

  def reset_accessoire(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @accessoire.destroy! if @accessoire
    @accessoire = Accessoire.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_accessoire
  end

  context "validations" do
    
    it "rejects empty title" do
      Accessoire.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_accessoire
      Accessoire.new(@valid_attributes).should_not be_valid
    end
    
  end

end