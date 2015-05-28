require 'sinatra'
require 'twitter'
# fix twitter and sinatra incompatibility:
require 'thin'
set :server, 'thin'

get '/' do
  erb :show
end
post '/result' do
  @search_term = params['terms']
  @number_of_items = params['number'].to_i
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = 'caSqNJgOPoAV1Ie3A6IeXbx69'
    config.consumer_secret     = '4LWCAyoH1Rm7LKidNUIavAeTFLbICwZUqeFNoPuCJIUeR1S5rM'
    config.access_token        = '3241260874-QzKVln4gcerYNBbm24rWUImN7wOQVcfDTbko7k8'
    config.access_token_secret = 'qIlE5HJlHhYmzMcYxPCECXSo3BCVkFsjMuNDzj6oTw2Mz'
  end
  @tweets_list = client.search(@search_term, result_type: 'recent').take(@number_of_items)
  erb :index
end
