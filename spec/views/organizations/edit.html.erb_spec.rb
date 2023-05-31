require 'rails_helper'

RSpec.describe 'organizations/edit' do
  let(:organization) do
    Organization.create!(
      name: 'MyString'
    )
  end

  before do
    assign(:organization, organization)
  end

  it 'renders the edit organization form' do
    render

    assert_select 'form[action=?][method=?]', organization_path(organization), 'post' do
      assert_select 'input[name=?]', 'organization[name]'
    end
  end
end
