require 'rails_helper'

RSpec.describe "incomes/show", type: :view do
  before(:each) do
    assign(:income, Income.create!(
      member: "Member",
      amount: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Member/)
    expect(rendered).to match(/2/)
  end
end
