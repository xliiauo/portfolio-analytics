require "async"
require "airrecord"
require "iex-ruby-client"

require_relative "env"

Airrecord.api_key = AIRTABLE_API_KEY

class Holdings < Airrecord::Table
    self.base_key = AIRTABLE_BASE_KEY
    self.table_name = AIRTABLE_TABLE_NAME
end

IEX::Api.configure do |config|
    config.publishable_token = IEX_TOKEN
    config.endpoint = IEX_ENDPOINT
end

iex = IEX::Api::Client.new

Holdings.all.each do |h|
    h["Last"] = iex.quote(h["Instrument"]).latest_price
    h.save
    puts h["Instrument"] + " is updated"
end
    
