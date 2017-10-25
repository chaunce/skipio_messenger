require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :uuid => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone_mobile => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString",
      :is_starred => false,
      :birth_month => 1,
      :birth_day => 1
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input[name=?]", "contact[first_name]"

      assert_select "input[name=?]", "contact[last_name]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[phone_mobile]"

      assert_select "input[name=?]", "contact[street_address]"

      assert_select "input[name=?]", "contact[city]"

      assert_select "input[name=?]", "contact[state]"

      assert_select "input[name=?]", "contact[zip_code]"

      assert_select "input[name=?]", "contact[is_starred]"

      assert_select "input[name=?]", "contact[birth_month]"

      assert_select "input[name=?]", "contact[birth_day]"
    end
  end
end
