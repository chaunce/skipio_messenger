class CreateContactMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts_messages do |t|
      t.integer :contact_id
      t.integer :message_id
    end
  end
end
