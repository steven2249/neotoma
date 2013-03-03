require 'httparty'
require 'JSON'

SCHEDULER.every '60s', :first_in => 0 do |job|
  result = HTTParty.get('http://taxosaurus.org/sources/list')
  
	if JSON.parse(result)['sources'][0] == "iPlant_TNRS"
			# out = "BOOM! It's up"
			out = 100
		else
			# out = "Sad face. It's down"
			out = 0
		end
  
  send_event('iplant_tnrs', { value: out })
end