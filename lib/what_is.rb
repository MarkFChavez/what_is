require "what_is/version"
require "net/http"
require "uri"

module WhatIs
  class Define
    DICT_API_KEY = "ae396fba-2435-4197-b780-c4b5485fec22"
    THES_API_KEY = "c80b99cc-421c-4f86-bc50-45ef40b371fe"

    def initialize(word)
      @word = word
      @has_definition = false
    end

    def define!
      thesaurus_endpoint = "http://www.dictionaryapi.com/api/v1/references/thesaurus/xml/#{@word}?key=#{THES_API_KEY}"
      uri = URI.parse(thesaurus_endpoint)
      response = Net::HTTP.get_response(uri)

      response.body
    rescue
      default_exception_message
    end

    def has_definition?
      @has_definition
    end

    private

    def default_exception_message
      "Oops. Something happened while defining this word"
    end
  end
end
