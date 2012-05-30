require 'spec_helper'

describe Audi do

  def reset_audi(options = {})
    @valid_attributes = {
      :id => 1,
      :naam => "RSpec is great for testing too"
    }

    @audi.destroy! if @audi
    @audi = Audi.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_audi
  end

  context "validations" do
    
    it "rejects empty naam" do
      Audi.new(@valid_attributes.merge(:naam => "")).should_not be_valid
    end

    it "rejects non unique naam" do
      # as one gets created before each spec by reset_audi
      Audi.new(@valid_attributes).should_not be_valid
    end
    
  end

end