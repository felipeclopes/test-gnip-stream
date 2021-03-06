require 'gnip-stream'
require 'yaml'

gnip_config = YAML.load_file("gnip.yml")

p "gnip configuration: #{gnip_config}"

#To connect to the special twitter powertrack api
twitter_stream = GnipStream::PowertrackClient.new(gnip_config[:endpoint], gnip_config[:username], gnip_config[:password])
twitter_stream.consume do |message|
  #process the message however you want
  File.open("./gnip.csv", 'a+'){|f| f.puts(message) }
end
