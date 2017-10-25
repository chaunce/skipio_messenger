require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
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
    @message = assign(:message, Message.create!(
      :body => "MyText",
      :contact_ids => contacts.collect { |c| c.id.to_s }.unshift('')
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "textarea[name=?]", "message[body]"
    end
  end
end
