Given /^I have no accessoires$/ do
  Accessoire.delete_all
end

Given /^I (only )?have accessoires titled "?([^\"]*)"?$/ do |only, titles|
  Accessoire.delete_all if only
  titles.split(', ').each do |title|
    Accessoire.create(:title => title)
  end
end

Then /^I should have ([0-9]+) accessoires?$/ do |count|
  Accessoire.count.should == count.to_i
end
