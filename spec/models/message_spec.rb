require 'rails_helper'

RSpec.describe Message, type: :model do
  include_context :skipio_webmocks

  before(:each) do
    contacts = [
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
    ]
    @message = Message.create!(
      :body => "MyText",
      :contact_ids => contacts.collect { |c| c.id.to_s }.unshift('')
    )
  end
  
  describe '#skipio_object' do
    it 'returns a hash of attributes' do
      expect(@message.skipio_object).to be_a(Hash)
      expect(@message.skipio_object).to include(:body)
    end
  end
end
