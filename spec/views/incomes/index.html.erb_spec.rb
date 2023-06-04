require 'rails_helper'

RSpec.describe "incomes/index", type: :view do
  before(:each) do
    assign(:incomes, [
      Income.create!(
        member: "Member",
        amount: 2
      ),
      Income.create!(
        member: "Member",
        amount: 2
      )
    ])
  end

  it "renders a list of incomes" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Member".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
