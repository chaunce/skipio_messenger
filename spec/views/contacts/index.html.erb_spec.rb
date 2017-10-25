require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  include_context :skipio_webmocks
 
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :phone_mobile => "Phone Mobile"
      ),
      Contact.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :phone_mobile => "Phone Mobile"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Mobile".to_s, :count => 2
    assert_select "tr>td", :text => 0.to_s, :count => 2
  end
end
