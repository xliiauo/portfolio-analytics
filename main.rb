require_relative "env"
require_relative "holdings"
require_relative "iex"

iex = IEX::Api::Client.new

Holdings.all.each do |h|
    h["Last"] = iex.quote(h["Instrument"]).latest_price
    h.save
    puts h["Instrument"] + " is updated"
end
    
