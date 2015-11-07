require 'rails_helper'

RSpec.describe "moneyrecords/new", type: :view do
  before(:each) do
    assign(:moneyrecord, Moneyrecord.new(
      :name => "MyString",
      :category_id => 1
    ))
  end

  it "renders new moneyrecord form" do
    render

    assert_select "form[action=?][method=?]", moneyrecords_path, "post" do

      assert_select "input#moneyrecord_name[name=?]", "moneyrecord[name]"

      assert_select "input#moneyrecord_category_id[name=?]", "moneyrecord[category_id]"
    end
  end
end
