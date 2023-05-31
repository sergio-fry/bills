When('Visit {string}') do |path|
  visit path
end

Then('See text {string}') do |text|
  expect(page).to have_content text
end

When('Click on {string}') do |element|
  click_on element
end

When('Fill in {string} with {string}') do |element, value|
  fill_in element, with: value
end
