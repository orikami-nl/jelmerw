Given /^I have no audis$/ do
  Audi.delete_all
end

Given /^I (only )?have audis titled "?([^\"]*)"?$/ do |only, titles|
  Audi.delete_all if only
  titles.split(', ').each do |title|
    Audi.create(:naam => title)
  end
end

Then /^I should have ([0-9]+) audis?$/ do |count|
  Audi.count.should == count.to_i
end
