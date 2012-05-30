require 'spec_helper'

describe Volvo do

  def reset_volvo(options = {})
    @valid_attributes = {
      :id => 1,
      :naam => "RSpec is great for testing too"
    }

    @volvo.destroy! if @volvo
    @volvo = Volvo.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_volvo
  end

  context "validations" do
    
    it "rejects empty naam" do
      Volvo.new(@valid_attributes.merge(:naam => "")).should_not be_valid
    end

    it "rejects non unique naam" do
      # as one gets created before each spec by reset_volvo
      Volvo.new(@valid_attributes).should_not be_valid
    end
    
  end

end