require 'spec_helper'

describe Peugeot do

  def reset_peugeot(options = {})
    @valid_attributes = {
      :id => 1,
      :naam => "RSpec is great for testing too"
    }

    @peugeot.destroy! if @peugeot
    @peugeot = Peugeot.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_peugeot
  end

  context "validations" do
    
    it "rejects empty naam" do
      Peugeot.new(@valid_attributes.merge(:naam => "")).should_not be_valid
    end

    it "rejects non unique naam" do
      # as one gets created before each spec by reset_peugeot
      Peugeot.new(@valid_attributes).should_not be_valid
    end
    
  end

end