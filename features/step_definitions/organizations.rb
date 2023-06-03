Given('Oraganization {string}') do |name|
  Domain::CreateOrganization.new(
    organization: FactoryBot.build(:organization, name:),
    creator: FactoryBot.create(:user)
  )
end
