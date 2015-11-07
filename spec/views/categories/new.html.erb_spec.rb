require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      :name => "MyString",
      :record_type => 1,
      :user_id => 1
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "input#category_record_type[name=?]", "category[record_type]"

      assert_select "input#category_user_id[name=?]", "category[user_id]"
    end
  end
end
