Given /^I have no peugeots$/ do
  Peugeot.delete_all
end

Given /^I (only )?have peugeots titled "?([^\"]*)"?$/ do |only, titles|
  Peugeot.delete_all if only
  titles.split(', ').each do |title|
    Peugeot.create(:naam => title)
  end
end

Then /^I should have ([0-9]+) peugeots?$/ do |count|
  Peugeot.count.should == count.to_i
end
