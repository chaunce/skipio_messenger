class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :uuid
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_mobile
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.boolean :is_starred
      t.integer :birth_month
      t.integer :birth_day

      t.timestamps
    end
  end
end
