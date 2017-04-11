When(/^I seed the record using seed_once$/) do
  Record.seed_once :id do |s|
    s.id = 1
    s.data = 'data'
  end
end
