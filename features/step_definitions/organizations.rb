def create_organization(name, creator: FactoryBot.create(:user))
  Domain::CreateOrganization.new(
    organization: FactoryBot.build(:organization, name:),
    creator:
  ).call
end

Given('Organization {string}') do |name|
  create_organization name
end
