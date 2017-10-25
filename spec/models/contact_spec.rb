require 'rails_helper'

RSpec.describe Contact, type: :model do
  include_context :skipio_webmocks

  before(:each) do
    @contact = Contact.create!(
      :first_name => "FirstName",
      :last_name => "LastName",
      :phone_mobile => "+18005554444"
    )
  end

  describe '#name' do
    it 'returns full name' do
      expect(@contact.name).to eq("FirstName LastName")
    end
  end

  describe '#skipio_object' do
    it 'returns a hash of attributes' do
      expect(@contact.skipio_object).to be_a(Hash)
      expect(@contact.skipio_object).to include(:first_name)
      expect(@contact.skipio_object).to include(:last_name)
      expect(@contact.skipio_object).to include(:email)
      expect(@contact.skipio_object).to include(:phone_mobile)
      expect(@contact.skipio_object).to include(:street_address)
      expect(@contact.skipio_object).to include(:city)
      expect(@contact.skipio_object).to include(:state)
      expect(@contact.skipio_object).to include(:zip_code)
      expect(@contact.skipio_object).to include(:is_starred)
      expect(@contact.skipio_object).to include(:birth_month)
      expect(@contact.skipio_object).to include(:birth_day)
    end
  end
end
