Then(/^I should have the new records$/) do
  Record.count.should == 1
  Record.find(1).data.should == 'data'
end
