require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  include_context :skipio_webmocks

  before(:each) do
    contacts = assign(:contacts, [
      Contact.create!(
        :first_name => "FirstName",
        :last_name => "LastName",
        :phone_mobile => "+18005554444"
      ),
      Contact.create!(
        :first_name => "FirstName",
        :last_name => "LastName",
        :phone_mobile => "+18005554444"
      )
    ])
    assign(:messages, [
      Message.create!(
        :body => "MyText",
        :contact_ids => contacts.collect { |c| c.id.to_s }.unshift('')
      ),
      Message.create!(
        :body => "MyText",
        :contact_ids => contacts.collect { |c| c.id.to_s }.unshift('')
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
