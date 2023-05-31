require 'rails_helper'

RSpec.describe 'organizations/index' do
  before do
    assign(:organizations, [
             Organization.create!(
               name: 'Name'
             ),
             Organization.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of organizations' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
