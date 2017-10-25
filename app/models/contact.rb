class Contact < ApplicationRecord
  include Skipio

  has_and_belongs_to_many :messages
  accepts_nested_attributes_for :messages, reject_if: :all_blank, allow_destroy: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_mobile, presence: true

  after_validation :create_skipio_contact, unless: :persisted?
  after_validation :update_skipio_contact, if: :persisted?

  def name
    [first_name, last_name].compact.join(' ')
  end

  def skipio_object
    attributes.with_indifferent_access.slice(:first_name, :last_name, :email, :phone_mobile, :street_address, :city, :state, :zip_code, :is_starred, :birth_month, :birth_day)
  end

  private

  def create_skipio_contact
    response = self.class.post('/contacts', headers: { 'Content-Type' => 'application/json' }, body: { 'contact' => skipio_object }.to_json)
    validate_response(response)
  end

  def update_skipio_contact
    return unless changed?

    response = self.class.put("/contacts/#{uuid}", headers: { 'Content-Type' => 'application/json' }, body: { 'contact' => skipio_object.slice(*changes.keys) }.to_json)
    validate_response(response)
  end

  def validate_response(response)
    body = JSON.parse(response.body)

    if body.include?('data')
      self.uuid = body.dig('data', 'id')
    else
      body.each { |attribute_name, message| errors.add(attribute_name, message) }
    end

    response
  end
end
