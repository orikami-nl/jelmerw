require 'spec_helper'

describe Vw do

  def reset_vw(options = {})
    @valid_attributes = {
      :id => 1,
      :naam => "RSpec is great for testing too"
    }

    @vw.destroy! if @vw
    @vw = Vw.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_vw
  end

  context "validations" do
    
    it "rejects empty naam" do
      Vw.new(@valid_attributes.merge(:naam => "")).should_not be_valid
    end

    it "rejects non unique naam" do
      # as one gets created before each spec by reset_vw
      Vw.new(@valid_attributes).should_not be_valid
    end
    
  end

end