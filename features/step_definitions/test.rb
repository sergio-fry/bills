When('variable {string} is set to {string}') do |name, value|
  @variables ||= {}
  @variables[name] = value
end

Then('variable {string} has value {string}') do |name, value|
  expect(@variables[name]).to eq value
end
