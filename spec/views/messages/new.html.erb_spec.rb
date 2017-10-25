require 'rails_helper'

RSpec.describe "messages/new", type: :view do
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
    assign(:message, Message.new(
      :body => "MyText",
      :contact_ids => contacts.collect { |c| c.id.to_s }.unshift('')
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "textarea[name=?]", "message[body]"
      assert_select "select[name=?]", "message[contact_ids][]"
    end
  end
end
