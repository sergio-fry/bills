When('Visit {string}') do |path|
  visit path
end

Then('See text {string}') do |text|
  expect(page).to have_content text
end
