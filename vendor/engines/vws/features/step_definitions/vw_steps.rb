Given /^I have no vws$/ do
  Vw.delete_all
end

Given /^I (only )?have vws titled "?([^\"]*)"?$/ do |only, titles|
  Vw.delete_all if only
  titles.split(', ').each do |title|
    Vw.create(:naam => title)
  end
end

Then /^I should have ([0-9]+) vws?$/ do |count|
  Vw.count.should == count.to_i
end
