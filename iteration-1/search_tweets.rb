require 'twitter'
search_term = ARGV[0]
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "PPwLzETwOf1uumQReBE0Un9Mf"
  config.consumer_secret     = "a2giV5qRtehgbUFEhjIRKr0XkHmAijRaOi5QIjGDmrmoRcB7Ef"
  config.access_token        = "3241260874-QzKVln4gcerYNBbm24rWUImN7wOQVcfDTbko7k8"
  config.access_token_secret = "qIlE5HJlHhYmzMcYxPCECXSo3BCVkFsjMuNDzj6oTw2Mz"
end
client.search(search_term, result_type: "recent").take(20).each do |tweet|
  puts tweet.text
end
