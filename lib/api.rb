require 'net/http'
require 'open-uri'
require 'json'

class GetActivity
    URL = "https://www.boredapi.com/api/activity"

    def get_activity
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)

        json = JSON.parse(response.body)
        activity = {
            :details => json["activity"],
            :type => json["type"]
        }
    end
end

# activities = GetAcitivity.new.get_activity
# puts activities