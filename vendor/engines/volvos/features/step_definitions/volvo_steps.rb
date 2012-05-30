Given /^I have no volvos$/ do
  Volvo.delete_all
end

Given /^I (only )?have volvos titled "?([^\"]*)"?$/ do |only, titles|
  Volvo.delete_all if only
  titles.split(', ').each do |title|
    Volvo.create(:naam => title)
  end
end

Then /^I should have ([0-9]+) volvos?$/ do |count|
  Volvo.count.should == count.to_i
end
