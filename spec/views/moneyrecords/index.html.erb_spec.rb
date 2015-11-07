require 'rails_helper'

RSpec.describe "moneyrecords/index", type: :view do
  before(:each) do
    assign(:moneyrecords, [
      Moneyrecord.create!(
        :name => "Name",
        :category_id => 1
      ),
      Moneyrecord.create!(
        :name => "Name",
        :category_id => 1
      )
    ])
  end

  it "renders a list of moneyrecords" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
