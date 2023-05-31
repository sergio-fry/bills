require 'rails_helper'

RSpec.describe 'organizations/show' do
  before do
    assign(:organization, Organization.create!(
                            name: 'Name'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
