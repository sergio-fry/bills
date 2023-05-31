require 'rails_helper'

RSpec.describe 'organizations/new' do
  before do
    assign(:organization, Organization.new(
                            name: 'MyString'
                          ))
  end

  it 'renders new organization form' do
    render

    assert_select 'form[action=?][method=?]', organizations_path, 'post' do
      assert_select 'input[name=?]', 'organization[name]'
    end
  end
end
