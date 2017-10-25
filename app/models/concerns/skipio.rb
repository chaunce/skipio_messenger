module Skipio
  extend ActiveSupport::Concern

  included do
    include HTTParty
    base_uri 'https://stage.skipio.com/api/v2/'
    default_params token: ENV['SKIPIO_TOKEN']
  end
end
