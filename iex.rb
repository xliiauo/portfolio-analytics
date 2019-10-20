require "iex-ruby-client"

IEX::Api.configure do |config|
    config.publishable_token = IEX_TOKEN
    config.endpoint = IEX_ENDPOINT
end