Given(/^I have already seeded a record$/) do
  record = Record.new
  record[:_id] = 1
  record[:data] = 'existing'
  record.upsert
end
