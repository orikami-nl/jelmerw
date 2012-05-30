require 'spec_helper'

describe Bmw do

  def reset_bmw(options = {})
    @valid_attributes = {
      :id => 1,
      :naam => "RSpec is great for testing too"
    }

    @bmw.destroy! if @bmw
    @bmw = Bmw.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_bmw
  end

  context "validations" do
    
    it "rejects empty naam" do
      Bmw.new(@valid_attributes.merge(:naam => "")).should_not be_valid
    end

    it "rejects non unique naam" do
      # as one gets created before each spec by reset_bmw
      Bmw.new(@valid_attributes).should_not be_valid
    end
    
  end

end