require "what_is/version"
require "what_is/configuration"
require "net/http"
require "uri"
require "nokogiri"

module WhatIs

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Define
    def initialize(word)
      @word = word.to_s
      @has_definition = false
    end

    def define!
      raise NoApiKeyException unless WhatIs.configuration.thesaurus_api_key

      thesaurus_endpoint = "http://www.dictionaryapi.com/api/v1/references/thesaurus/xml/#{@word}?key=#{WhatIs.configuration.thesaurus_api_key}"
      uri = URI.parse(thesaurus_endpoint)
      response = Net::HTTP.get_response(uri)
      doc = Nokogiri::XML(response.body)

      doc.xpath("//mc").first.text
    rescue NoApiKeyException => e
      no_api_key_exception_message
    rescue Exception => e
      default_exception_message
    end

    def has_definition?
      @has_definition
    end

    private

    def default_exception_message
      "Oops! Something happened while defining this word."
    end

    def no_api_key_exception_message
      "No api key provided."
    end
  end
end
