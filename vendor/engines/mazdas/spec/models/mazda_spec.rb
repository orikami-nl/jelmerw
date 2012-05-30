require 'spec_helper'

describe Mazda do

  def reset_mazda(options = {})
    @valid_attributes = {
      :id => 1,
      :naam => "RSpec is great for testing too"
    }

    @mazda.destroy! if @mazda
    @mazda = Mazda.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_mazda
  end

  context "validations" do
    
    it "rejects empty naam" do
      Mazda.new(@valid_attributes.merge(:naam => "")).should_not be_valid
    end

    it "rejects non unique naam" do
      # as one gets created before each spec by reset_mazda
      Mazda.new(@valid_attributes).should_not be_valid
    end
    
  end

end