Given /^I have no mazdas$/ do
  Mazda.delete_all
end

Given /^I (only )?have mazdas titled "?([^\"]*)"?$/ do |only, titles|
  Mazda.delete_all if only
  titles.split(', ').each do |title|
    Mazda.create(:naam => title)
  end
end

Then /^I should have ([0-9]+) mazdas?$/ do |count|
  Mazda.count.should == count.to_i
end
