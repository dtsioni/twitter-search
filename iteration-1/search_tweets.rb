require 'twitter'
search_term = ARGV[0]
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "caSqNJgOPoAV1Ie3A6IeXbx69"
  config.consumer_secret     = "4LWCAyoH1Rm7LKidNUIavAeTFLbICwZUqeFNoPuCJIUeR1S5rM"
  config.access_token        = "3241260874-QzKVln4gcerYNBbm24rWUImN7wOQVcfDTbko7k8"
  config.access_token_secret = "qIlE5HJlHhYmzMcYxPCECXSo3BCVkFsjMuNDzj6oTw2Mz"
end
client.search(search_term, result_type: "recent").take(20).each do |tweet|
  puts tweet.text
end
