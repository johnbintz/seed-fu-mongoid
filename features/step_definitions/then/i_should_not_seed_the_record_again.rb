Then(/^I should not seed the record again$/) do
  Record.count.should == 1
  Record.find(1).data.should == 'existing'
end
