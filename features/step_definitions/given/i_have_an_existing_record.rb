Given(/^I have an existing record$/) do
  record = Record.new
  record[:_id] = 1
  record[:data] = 'other'
  record.upsert
end
