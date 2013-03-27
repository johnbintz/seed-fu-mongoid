When(/^I seed records from a block$/) do
  Record.seed :id do |s|
    s.id = 1
    s.data = 'data'
  end
end
