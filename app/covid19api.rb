require 'httparty'

class Covid19Api
    include HTTParty
    base_uri 'https://api.covid19api.com'

    def countries
        self.class.get '/countries'
    end

    def summary
        self.class.get '/summary'
    end

    def stats
        self.class.get '/stats'
    end
end