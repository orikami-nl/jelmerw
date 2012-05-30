Given /^I have no bmws$/ do
  Bmw.delete_all
end

Given /^I (only )?have bmws titled "?([^\"]*)"?$/ do |only, titles|
  Bmw.delete_all if only
  titles.split(', ').each do |title|
    Bmw.create(:naam => title)
  end
end

Then /^I should have ([0-9]+) bmws?$/ do |count|
  Bmw.count.should == count.to_i
end
