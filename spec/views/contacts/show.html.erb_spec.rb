require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  include_context :skipio_webmocks

  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :uuid => "Uuid",
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone_mobile => "Phone Mobile",
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :zip_code => "Zip Code",
      :is_starred => false,
      :birth_month => 2,
      :birth_day => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uuid/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Mobile/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
