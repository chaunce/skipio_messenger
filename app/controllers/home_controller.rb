class HomeController < ApplicationController
  # GET /home
  # GET /home.json
  def index
    @contacts_count = Contact.count
    @messages_count = Message.count
  end
end
