When('visit {string}') do |path|
  visit path
end

Then('see text {string}') do |text|
  expect(page).to have_content text
end

Then('can\'t see text {string}') do |text|
  expect(page).not_to have_content text
end

When('click on {string}') do |element|
  click_on element
end

When('fill in {string} with {string}') do |element, value|
  fill_in element, with: value
end

When('select {string} from {string}') do |value, field|
  select value, from: field
end
