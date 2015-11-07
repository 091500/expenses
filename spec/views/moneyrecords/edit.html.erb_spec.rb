require 'rails_helper'

RSpec.describe "moneyrecords/edit", type: :view do
  before(:each) do
    @moneyrecord = assign(:moneyrecord, Moneyrecord.create!(
      :name => "MyString",
      :category_id => 1
    ))
  end

  it "renders the edit moneyrecord form" do
    render

    assert_select "form[action=?][method=?]", moneyrecord_path(@moneyrecord), "post" do

      assert_select "input#moneyrecord_name[name=?]", "moneyrecord[name]"

      assert_select "input#moneyrecord_category_id[name=?]", "moneyrecord[category_id]"
    end
  end
end
