Given /^I have no fords$/ do
  Ford.delete_all
end

Given /^I (only )?have fords titled "?([^\"]*)"?$/ do |only, titles|
  Ford.delete_all if only
  titles.split(', ').each do |title|
    Ford.create(:naam => title)
  end
end

Then /^I should have ([0-9]+) fords?$/ do |count|
  Ford.count.should == count.to_i
end
