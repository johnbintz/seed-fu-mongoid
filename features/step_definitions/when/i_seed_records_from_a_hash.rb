When(/^I seed records from a hash$/) do
  Record.seed :id,
    { :id => 1, :data => 'data' }
end
