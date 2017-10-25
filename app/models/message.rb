class Message < ApplicationRecord
  include Skipio

  has_and_belongs_to_many :contacts

  validates :body, presence: true
  validate :has_contacts

  after_validation :create_skipio_message, unless: :persisted?

  def skipio_object
    attributes.with_indifferent_access.slice(:body)
  end

  private

  def has_contacts
    errors.add(:base, 'must have at least one contact selectes') if contacts.none?
  end

  def create_skipio_message
    response = self.class.post('/messages', headers: { 'Content-Type' => 'application/json' }, body: { 'recipients' => contacts.collect{ |contact| "contact-#{contact.uuid}" }, 'message' => skipio_object }.to_json)
    JSON.parse(response.body).each { |attribute_name, message| errors.add(attribute_name, message) } unless response.body.empty?

    response
  end
end
