require 'rails_helper'

RSpec.describe "incomes/edit", type: :view do
  let(:income) {
    Income.create!(
      member: "MyString",
      amount: 1
    )
  }

  before(:each) do
    assign(:income, income)
  end

  it "renders the edit income form" do
    render

    assert_select "form[action=?][method=?]", income_path(income), "post" do

      assert_select "input[name=?]", "income[member]"

      assert_select "input[name=?]", "income[amount]"
    end
  end
end
