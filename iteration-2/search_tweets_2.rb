require 'twitter'
require 'rubyXL'
# open files
search_term = ARGV[0]
workbook_name = ARGV[1]
# search term is default name if file name not given
workbook_name ||= search_term
number_of_items = 20
# twitter app authentication
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'caSqNJgOPoAV1Ie3A6IeXbx69'
  config.consumer_secret     = '4LWCAyoH1Rm7LKidNUIavAeTFLbICwZUqeFNoPuCJIUeR1S5rM'
  config.access_token        = '3241260874-QzKVln4gcerYNBbm24rWUImN7wOQVcfDTbko7k8'
  config.access_token_secret = 'qIlE5HJlHhYmzMcYxPCECXSo3BCVkFsjMuNDzj6oTw2Mz'
end
tweets_list = client.search(search_term, result_type: 'recent').take(number_of_items)
# set up spreadsheet
workbook = RubyXL::Workbook.new
worksheet = workbook[0]
worksheet.sheet_name = search_term
# populate spreadsheet
tweets_list.each_with_index do |tweet, index|
  worksheet.add_cell(index, 0, tweet.text)
end

workbook.write("./#{workbook_name}.xlsx")