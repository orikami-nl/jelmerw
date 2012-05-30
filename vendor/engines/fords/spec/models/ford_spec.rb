require 'spec_helper'

describe Ford do

  def reset_ford(options = {})
    @valid_attributes = {
      :id => 1,
      :naam => "RSpec is great for testing too"
    }

    @ford.destroy! if @ford
    @ford = Ford.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_ford
  end

  context "validations" do
    
    it "rejects empty naam" do
      Ford.new(@valid_attributes.merge(:naam => "")).should_not be_valid
    end

    it "rejects non unique naam" do
      # as one gets created before each spec by reset_ford
      Ford.new(@valid_attributes).should_not be_valid
    end
    
  end

end