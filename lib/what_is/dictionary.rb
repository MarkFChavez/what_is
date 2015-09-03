require "net/http"
require "uri"
require "nokogiri"

module WhatIs
  class Dictionary
    BASE_URL = "http://www.dictionaryapi.com"

    def initialize(word)
      @word = word
    end

    def define!
      raise WhatIs::NoApiKeyException unless api_key

      uri = URI.parse(api_endpoint)
      response = Net::HTTP.get_response(uri)

      response

    rescue NoApiKeyException => e
      no_api_key_exception_message
    end

    private

    def api_endpoint
      "#{BASE_URL}/api/v1/references/collegiate/xml/#{@word}?key=#{api_key}"
    end

    def api_key
      WhatIs.configuration.dictionary_api_key
    end

    def no_api_key_exception_message
      "ERROR: No api key provided for dictionary."
    end
  end
end
